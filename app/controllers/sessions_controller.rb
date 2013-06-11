# This controller handles the login/logout function of the site.  
class SessionsController < BaseController

  skip_before_filter :store_location, :only => [:new, :create]
 respond_to :js, only: [:new]
  def index
    redirect_to :action => "new"
  end  

  def new
    redirect_to user_path(current_user) and return if current_user
    @user_session = UserSession.new
    render :partial => "/sessions/new"
  end

  def fb_login
    @oauth = Koala::Facebook::OAuth.new(configatron.facebook.key, configatron.facebook.secret, configatron.facebook.callback_url)
    accessToken = params[:accessToken]
    fb_user_id = params[:fb_user_id]

    
#    flash[:notice] = "accessToken #{accessToken}"
    if(accessToken == nil || fb_user_id == nil)

      return redirect_to  :action => :new
      
    else
#      flash[:notice] = "authinfo: #{accessToken}"
      begin
        @graph = Koala::Facebook::API.new(accessToken)
        # on windows this is necessary
        Koala.http_service.http_options = {
          	ssl: {
              verify: false
          }
        }
        fb_user = @graph.get_object("me")
        #flash[:notice] = "#{fb_user}"

        
      rescue
        logger.error "fb_login: after user_info_from_cookies:#{$!}"
      end

      @user = User.find_by_fb_id(fb_user["id"]) || User.find_by_email(fb_user["email"])

      if(@user  == nil)
        birthday = Date.strptime(fb_user["birthday"], '%m/%d/%Y') unless fb_user["birthday"].blank?

        @user = User.new({
          :fb_id => fb_user["id"],
          :firstname => fb_user["first_name"],
          :lastname => fb_user["last_name"],
          :login => fb_user["username"].delete("."), #remove illegal characters
          :gender => fb_user["gender"] == 'male' ? 'M' : 'F',
          :email => fb_user["email"],
          #:timezone => fb_user["timezone"],
          :fb_locale => fb_user["locale"],
          :fb_url => fb_user["link"],
          :fb_access_token => accessToken,
          :birthday => birthday
        })
        return render :template => "users/new"
      else

        @user.update_attributes({
          :fb_id => fb_user["id"],
          :firstname => fb_user["first_name"],
          :lastname => fb_user["last_name"],
          :gender => fb_user["gender"] == 'male' ? 'M' : 'F',
          :email => fb_user["email"],
          #:timezone => fb_user["timezone"],
          :fb_locale => fb_user["locale"],
          :fb_url => fb_user["link"],
          :fb_access_token => accessToken
        })
        @user_session = UserSession.new(@user, true)
        if @user_session.save

          current_user = @user_session.record #if current_user has been called before this, it will ne nil, so we have to make to reset it

          flash[:notice] = :thanks_youre_now_logged_in.l
          redirect_to dashboard_user_path(current_user)
        else
          flash[:notice] = :uh_oh_we_couldnt_log_you_in_with_the_username_and_password_you_entered_try_again.l
          render :action => :new
        end

    end

    end

    

  end
  def fb_login_old
    @oauth = Koala::Facebook::OAuth.new(configatron.facebook.key, configatron.facebook.secret, configatron.facebook.callback_url)


    begin
      authinfo = @oauth.get_user_info_from_cookies(cookies)
      session[]
      logger.error "fb_login: after user_info_from_cookies: #{authinfo.to_s}"
    rescue
      logger.error "fb_login: after user_info_from_cookies:#{$!}"
    end

    code = params[:code];
    if(code.blank? && (authinfo == nil || authinfo.empty?))
      logger.error "fb_login: redirect to FB. code:#{code} authinfo:#{authinfo}"
      # redirect to fb
      #redirect_to "http://www.facebook.com/dialog/oauth/?#{configatron.facebook.key}&redirect_uri=#{configatron.facebook.callback_url}&scope=email,user_about_me,user_birthday,user_photos"
      redirect_to @oauth.url_for_oauth_code
    else
      begin
      if(authinfo == nil || authinfo.empty?)
        auth_token = @oauth.get_access_token(code)
        logger.error "fb_login: after oauth.get_access_token. code:#{code} auth_token #{auth_token} "

      else
        auth_token = authinfo[:auth_token]
      end
      rescue
        logger.error "#{$!}"
      end
      @graph = Koala::Facebook::API.new(auth_token)
      fb_user = @graph.get_object("me", :access_token => auth_token)
      flash[:notice] = "#{fb_user}"

      @user = User.find_by_fb_id(fb_user["id"]) || User.find_by_email(fb_user["email"]) || User.new
      @user.update_attributes({
        :fb_id => fb_user["id"],
        :firstname => fb_user["first_name"],
        :lastname => fb_user["last_name"],
        :gender => fb_user["gender"] == 'male' ? 'M' : 'F',
        :email => fb_user["email"],
        #:timezone => fb_user["timezone"],
        :fb_locale => fb_user["locale"],
        :fb_url => fb_user["link"],
        :fb_access_token => auth_token
      })
      @user_session = UserSession.new(@user, true)
      if @user_session.save

        current_user = @user_session.record #if current_user has been called before this, it will ne nil, so we have to make to reset it

        flash[:notice] = :thanks_youre_now_logged_in.l
        redirect_back_or_default(dashboard_user_path(current_user))
      else
        flash[:notice] = :uh_oh_we_couldnt_log_you_in_with_the_username_and_password_you_entered_try_again.l
        render :action => :new
      end
    end

   

  end

  def create
    @user_session = UserSession.new(:login => params[:email], :password => params[:password], :remember_me => params[:remember_me])

    if @user_session.save
      current_user = @user_session.record #if current_user has been called before this, it will ne nil, so we have to make to reset it

	respond_to do |format|
#	  format.html { redirect_to dashboard_user_path(current_user) }
	  format.js { render :partial => "/sessions/made" }	  
	end
    else
      respond_to do |format|
        format.js { render :partial => "/sessions/error", :locals => {:errors => @user_session.errors.full_messages} }
      end
    end
  end

  def destroy
    current_user_session.destroy
    reset_session
    flash[:notice] = :youve_been_logged_out_hope_you_come_back_soon.l
    redirect_to "/"
  end

end

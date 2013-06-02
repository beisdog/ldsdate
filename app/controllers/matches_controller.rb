class MatchesController < BaseController
  before_filter :login_required

  def index
    @users = User.all_except_me(current_user)
    my_sent_statuses
  end

  def create
    @user = current_user.send_match(params[:status_id], params[:user_id])
    my_sent_statuses
  end

  def sent
    @matches = current_user.positive_matches
  end
end

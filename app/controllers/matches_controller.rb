class MatchesController < BaseController
  before_filter :login_required

  def index
    @users = User.all_except_me(current_user)
    @sent_statuses = sent_statuses
  end

  def create
    @user = current_user.send_match(params[:status_id], params[:user_id])
    @sent_statuses = sent_statuses
  end

  private

  def sent_statuses
    sent_statuses = {}
    current_user.sent_matches.map do |match|
      sent_statuses[match.receiver_id] = match.sender_status
    end
    sent_statuses
  end
end

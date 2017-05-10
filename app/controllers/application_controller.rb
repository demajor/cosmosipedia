class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  # before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def downgrade
    @user = User.find(current_user.id)
    flash[:alert] =  "You've been downgraded to a Standard user and all of your wikis are public!"
    @user.downgrade
    redirect_to user_path(@user)
  end

  def user_not_authorized
    flash[:alert] = "You're not authorized to do that!"
    redirect_to(request.referrer || root_path)
  end
end
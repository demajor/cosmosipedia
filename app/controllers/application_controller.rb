class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # def after_sign_in_path_for(resource)
  #   root_path
  # end

  private

  def user_not_authorized
    flash[:alert] = "You're not authorized to do that!"
    # redirect_to(request.referrer || root_path)
    redirect_to @wiki
  end
end
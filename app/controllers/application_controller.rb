class ApplicationController < ActionController::API
  include Pundit::Authorization

  def current_user
    @current_user ||= User.joins(:realties).last
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
  
    def user_not_authorized
      flash[:warning] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end
end

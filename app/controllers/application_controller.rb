class ApplicationController < ActionController::API
  include Pundit::Authorization

  def current_user
    # @current_user ||= User.joins(:realties).last
    @current_user ||= User.find(3)
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

    def user_not_authorized
      render json: { error: "You are not authorized to perform this action."}, status: 403
    end
end

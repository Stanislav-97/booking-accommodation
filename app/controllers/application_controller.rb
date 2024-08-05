class ApplicationController < ActionController::API
  include Pundit::Authorization

  before_action :authenticate_user

  attr_reader :current_user

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def authenticate_user
    auth_token = AuthToken.find_by(token: request.headers[:token])

    if auth_token.present? && auth_token.expires_at < Time.current
      @current_user = auth_token.user
    else
      user_not_authorized
    end
  end

  def user_not_authorized
    render json: { error: "You are not authorized to perform this action." }, status: 403
  end
end

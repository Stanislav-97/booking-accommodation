class ApplicationController < ActionController::API
  include Pundit::Authorization

  def current_user
    @current_user ||= User.last
  end
end

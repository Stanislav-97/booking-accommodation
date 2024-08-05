class Api::V1::Realties::BookingsController < ApplicationController
  def create
    if current_user.present?
      create_booking!(current_user)
    else
      user = User.transaction do
        user = sign_up_user!
        create_booking!(user)
        user
      end
      log_in_user!(user)
    end

    head :ok
  end

  private

  def authenticate_user
    auth_token = AuthToken.find_by(token: request.headers[:token])
    return unless auth_token.present?

    @current_user = auth_token.user
  end

  def realty
    @realty ||= Realty.find(params[:realty_id])
  end

  def create_booking!(user)
    Bookings::Creator.new(realty, user, booking_params).call
  end

  def sign_up_user!
    User.create!(
      first_name: user_params[:first_name],
      last_name: user_params[:last_name],
      email: user_params[:email],
      phone: user_params[:phone],
      organization_admin: false
    )
  end

  def log_in_user!(user)
    user_token = AuthTokens::Creator.new(user).call
    response.headers[:token] = user_token.token
  end

  # params example:
  #   {
  #     realty_id: 4,
  #     booking: {
  #       date_from: "Some date",
  #       date_to: "Some date"
  #     },
  #     user: {
  #       first_name: "FN",
  #       last_name: "LN",
  #       email: "Email",
  #       phone: "phone"
  #     }
  #   }

  def booking_params
    params.require(:booking).permit(:date_from, :date_to, :paid_amount)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone)
  end
end

class Api::V1::Realties::BookingsController < ApplicationController
  skip_before_action :authenticate_user

  def create
    # TODO: check user is authenticated and skip user creation
    # TODO: wrap to transaction https://api.rubyonrails.org/classes/ActiveRecord/Transactions/ClassMethods.html
    user = sign_up_user!
    create_booking!

    log_in_user!(user)
    head :ok
  end

  private

  def realty
    @realty ||= Realty.find(params[:realty_id])
  end

  def create_booking!
    Bookings::Creator.new(realty, booking_attrs).call
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

  def booking_attrs
    fio = "#{user_params[:first_name]} #{user_params[:last_name]}"

    booking_params.to_h.merge(
      fio:,
      email: user_params[:email],
      phone: user_params[:phone]
    )
  end

  def booking_params
    params.require(:booking).permit(:date_from, :date_to)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone)
  end
end

class Api::V1::Manage::BookingsController < ApplicationController

  def index
    render json: { data: BookingBlueprint.render_as_hash(bookings) }
  end

  def create
    booking = Bookings::Creator.new(realty, booking_params).call
    render json: { data: BookingBlueprint.render(booking) }
  end

  def update
    booking.update!(booking_params)
    render json: { data: BookingBlueprint.render(booking) }
  end

  def destroy
    booking.destroy
    render json: { data: BookingBlueprint.render(bookings) }
  end

  private

  def realty
    @realty ||= policy_scope(Realty).find(params[:realty_id])
  end

  def bookings
    @bookings ||= realty.bookings
  end

  def booking
    @booking ||= realty.bookings.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(
      :date_from, 
      :date_to, 
      :paid_amount, 
      :fio, 
      :phone,
      :email
    )
  end
end
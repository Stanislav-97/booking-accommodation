class Api::V1::Manage::BookingsController < ApplicationController
  before_action -> { authorize(bookings) }, only: [:index, :create]
  before_action -> { authorize(booking) }, only: [:update, :destroy]

  def index
    render json: { data: BookingBlueprint.render_as_hash(bookings) }
  end

  def create
    booking = Bookings::Creator.new(realty, booking_params).call
    render json: { data: BookingBlueprint.render_as_hash(booking) }
  end

  def update
    booking.update!(Bookings::Updator.new(realty, booking_params).call)
    render json: { data: BookingBlueprint.render_as_hash(booking) }
  end

  def destroy
    booking.destroy
    render json: { data: BookingBlueprint.render_as_hash(bookings) }
  end

  private

  def realty
    @realty ||= policy_scope(Realty).find(params[:realty_id])
  end

  def bookings
    @bookings ||= policy_scope(Booking)
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
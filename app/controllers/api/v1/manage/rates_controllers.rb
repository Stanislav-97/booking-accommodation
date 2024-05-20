class Api::V1::Manage::RatesController < ApplicationController
  #before_action -> { authorize(realty) }

  def index
    render json: { data: RateBlueprint.render_as_hash(rates) }
  end

  def create
    booking = Bookings::Creator.new(realty, booking_params).call
    render json: { data: BookingBlueprint.render_as_hash(booking) }
  end

  def update
    Bookings::Updater.new(booking, booking_params).call
    render json: { data: BookingBlueprint.render_as_hash(booking) }
  end

  private

  def realty
    @realty ||= policy_scope(Realty).find(params[:realty_id])
  end

  def rates
    @rates ||= organization.rates
  end

  def rate
    @rate ||= rates.find(params[:id])
  end

  def rate_params
    params.require(:rate).permit(
      :name, 
      :date_to, 
      :extra_change, 
      :extra_change_type
    )
  end
end

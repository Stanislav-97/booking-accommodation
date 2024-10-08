class Api::V1::Manage::RatesController < ApplicationController
  before_action -> { authorize(rates) }, only: %i[index create]
  before_action -> { authorize(rate) }, only: %i[update]

  def index
    render json: { data: RateBlueprint.render_as_hash(rates) }
  end

  def create
    rates.create!(rate_params)
    render json: { data: RateBlueprint.render_as_hash(rates) }
  end

  def update
    rate.update!(rate_params)
    render json: { data: RateBlueprint.render_as_hash(rates) }
  end

  private

  def rates
    @rates ||= policy_scope(Rate)
  end

  def rate
    @rate ||= rates.find(params[:id])
  end

  def rate_params
    params.require(:rate).permit(
      :name,
      :extra_charge,
      :extra_charge_type
    )
  end
end

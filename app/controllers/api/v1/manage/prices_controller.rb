class Api::V1::Manage::PricesController < ApplicationController
  before_action -> { authorize(realty) }

  def index
    render json: { data: PriceBlueprint.render_as_hash(prices) }
  end
  
  def update
    Prices::Updater.new(price, price_params).call
    render json: { data: PriceBlueprint.render_as_hash(price) }
  end

  private

  def realty
    @realty ||= policy_scope(Realty).find(params[:realty_id])
  end

  def prices
    @prices ||= realty.prices(date: date_from...date_to)
  end

  def price
    @price ||= prices.find(params[:id])
  end

  def price_params
    params.require(:price).permit(
      :date_from,
      :date_to
    )
  end
end
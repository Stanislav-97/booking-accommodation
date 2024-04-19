class Api::V1::Manage::PricesController < ApplicationController
  before_action -> { authorize(realty) }

  def index
    render json: { data: PriceBlueprint.render_as_hash(prices) }
  end
  
  def update
    price.update!(price_params)
    render json: { data: PriceBlueprint.render_as_hash(prices) }
  end

  private

  def realty
    @realty ||= policy_scope(Realty).find(params[:realty_id])
  end

  def prices
    @prices ||= realty.prices
  end

  def price
    @price ||= prices.find(params[:id])
  end

  def price_params
    params.require(:price).permit(
      :date,
      :amount
    )
  end
end
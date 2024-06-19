class Api::V1::RealtiesController < ApplicationController
  def index
    render json: { data: RealtyBlueprint.render_as_hash(realties) }
  end

  def show
    render json: { data: RealtyBlueprint.render_as_hash(realty) }
  end

  private

  def realties
    @realties ||= Realties::Filter.new(realty_params, facilities).call
  end

  def realty
    @realty ||= realties.find(params[:id])
  end

  def realty_params
    params.require(:realty).permit(
      :building_year,
      :floor,
      :description,
      :area,
      :entrance,
      :rooms_count,
      :realty_type,
      :base_price,
      :lon,
      :lat,
      :address
    )
  end
end

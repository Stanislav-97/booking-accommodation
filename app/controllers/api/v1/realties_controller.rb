class Api::V1::RealtiesController < ApplicationController
  def index
    render json: { data: RealtyBlueprint.render_as_hash(realties) }
  end

  def show
    render json: { data: RealtyBlueprint.render_as_hash(realty) }
  end

  private

  def realties
    @realties ||= Realties::Filter.new(realty_params).call
  end

  def realty
    @realty ||= realties.find(params[:id])
  end

  def realty_params
    params.require(:filters).permit(
      :rooms_count,
      :realty_type,
      building_year: %i[from to],
      floor: %i[from to],
      area: %i[from to],
      facility_ids: []
    )
  end
end

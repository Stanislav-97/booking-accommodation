class Api::V1::RealtiesController < ApplicationController
  def index
    render json: { data: RealtyBlueprint.render_as_hash(realties) }
  end

  def show
    render json: { data: RealtyBlueprint.render_as_hash(realty) }
  end

  private

  def realties
    @realties ||= Realty.all
  end

  def realty
    @realty ||= realties.find(params[:id])
  end
end

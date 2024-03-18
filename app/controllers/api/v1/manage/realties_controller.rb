class Api::V1::Manage::RealtiesController < ApplicationController
  #TODO:добавить полиси. 
  #Тесты контроллеров
  before_action :realties, only: [:show, :create, :update, :destroy]

  def index
    render json: { data: RealtyBlueprint.render(realties) }
  end

  def show
    realty = realties.find(params[:id])
    render json: { data: RealtyBlueprint.render(realty) }
  end

  def create
    realty = realties.new(realty_params)
    render json: { data: RealtyBlueprint.render(realty) }
  end

  def update
    ealty = realties.find(params[:id])
    render json: { data: RealtyBlueprint.render(realty) }
  end

  def destroy
    realty = realties.find(params[:id])
    realty.destroy

    render json: { data: RealtyBlueprint.render(realties) }
  end

  private

  def realties
    @realties ||= current_user.realties
    authorize @realties
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
      :address)
  end
end

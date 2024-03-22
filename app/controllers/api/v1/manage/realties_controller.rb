class Api::V1::Manage::RealtiesController < ApplicationController
  #Тесты контроллеров
  before_action -> { authorize(realties) }, only: [:index, :create]
  before_action -> { authorize(realty) }, only: [:show, :update, :destroy]

  def index
    render json: { data: RealtyBlueprint.render(realties) }
  end

  def show
    render json: { data: RealtyBlueprint.render(realty) }
  end

  def create
    realty = realties.create!(realty_params)
    render json: { data: RealtyBlueprint.render(realty) }
  end

  def update
    realty.update!(realty_params)
    render json: { data: RealtyBlueprint.render(realty) }
  end

  def destroy
    realty.destroy
    render json: { data: RealtyBlueprint.render(realties) }
  end

  private

  def realties
    @realties ||= policy_scope(Realty)
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
      :address)
  end
end

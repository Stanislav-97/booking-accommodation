class RealtiesController < ApplicationController

  def index
    @realties = current_user.realties
    #render json: RealtyBlueprint.render(@realties)
  end

  def show
    @realty = Realty.find(params[:id])
  end

  def create
    @realty = current_user.realties.new(realty_params)
    if @realty.save
      redirect_to realties_path
    else
      render :show
    end
  end

  def update
    @realty = Realty.find(params[:id])

    if @realty.update(realty_params)
      redirect_to @realty
    else
      render :show
    end
  end

  def destroy
    @realty = Realty.find(params[:id])
    @realty.destroy

    redirect_to root_path
  end


  private

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

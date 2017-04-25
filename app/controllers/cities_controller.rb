class CitiesController < ApplicationController
  def index
    @city = City.all
  end

  def show
    @city = City.find(params[:id])
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    
    if @city.save
    redirect_to new_post_path

    end
  end

  private

  def city_params
    params.require(:city).permit(:id, :post_id, :name, :country, :continent)
  end
end

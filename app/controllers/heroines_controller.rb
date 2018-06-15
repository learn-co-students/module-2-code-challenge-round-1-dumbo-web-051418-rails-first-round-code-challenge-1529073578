class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
    render :show
  end

  def new
    @heroine = Heroine.new
    render :new
  end

  def create
    @heroine = Heroine.find_or_create_by(super_name: heroine_params[:super_name])
    @power = Power.find(heroine_params[:power_id])
    redirect_to heroine_path(@heroine)
  end


  # def searchpowers
  #   @power = Power.find(params[:power])
  # end

  private
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end

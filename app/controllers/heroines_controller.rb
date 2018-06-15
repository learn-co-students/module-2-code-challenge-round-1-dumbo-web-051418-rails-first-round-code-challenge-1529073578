class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end


  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.find_or_create_by(name: heroine_params[:name], super_name: heroine_params[:super_name])
    @power = Power.find_by(name: heroine_params[:power])#finds the power object given the name of power

    @heroine.power = @power #associate heroine with the power
    @heroine.save

    redirect_to heroine_path(@heroine)
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  private
  def heroine_params
  params.require(:heroine).permit(:name, :super_name, :power)
  end

end

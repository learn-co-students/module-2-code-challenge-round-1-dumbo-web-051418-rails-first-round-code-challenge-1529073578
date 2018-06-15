require 'pry'

class HeroinesController < ApplicationController
  def index

    if params[:power] && params[:power] != ""
      power = Power.find_by(name: params[:power])
      @heroines = power.heroines
    else
      @heroines = Heroine.all
    end
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)

    if @heroine.save
      redirect_to heroine_path(@heroine)
    else
      render :new
    end
  end

  private
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end

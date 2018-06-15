class HeroinesController < ApplicationController
  def index
    @heroines = nil
    if params[:filter_by_power] == nil
      @heroines = Heroine.all
    elsif Power.find_by(name: params[:filter_by_power]) != nil
      @heroines = Heroine.all.select { |heroine| heroine.power_id == Power.find_by(name: params[:filter_by_power]).id}
    end
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.create(heroine_params)
    redirect_to heroine_path(@heroine)
  end

  private
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end

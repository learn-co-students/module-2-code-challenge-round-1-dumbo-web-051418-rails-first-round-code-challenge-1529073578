class PowersController < ApplicationController
  def index
    @powers = Power.all
  end
  #
  def show
    @power = find_power
    render :show
  end

  private
  def find_power
    @power = Power.find(params[:id])
  end
  
end

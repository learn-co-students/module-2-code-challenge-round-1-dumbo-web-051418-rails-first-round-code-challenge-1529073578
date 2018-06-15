class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def show
    @power = Power.find(params[:id])
    render :show
  end

  private

  def power_params
    params.require(:power).permit(:name)
  end
end

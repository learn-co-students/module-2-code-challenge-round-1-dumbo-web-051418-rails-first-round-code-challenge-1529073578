class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def show

    @power = Power.all.find(params[:id])

  end
end

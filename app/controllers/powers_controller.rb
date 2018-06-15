class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def show
    @power = find_id
  end


  private
  def find_id
    Power.find_by(params[:id])
  end
end

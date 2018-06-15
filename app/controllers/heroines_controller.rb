class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.all.find(params[:id])
  end

  def new
    @heroine = Heroine.new #I would of used create but in order to validate first I must create then validate instead of doing it all at once

  end


end

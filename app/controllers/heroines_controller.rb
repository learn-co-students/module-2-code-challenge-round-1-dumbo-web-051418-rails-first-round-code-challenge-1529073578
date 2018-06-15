class HeroinesController < ApplicationController

  def index
    flash.discard
    @heroines = Heroine.all
  end
  def search_post
    if params[:commit] == "Search"
      @heroines = Heroine.all.select do |hero|
        hero.power.name == params[:power]
      end
      if @heroines.empty?
        flash.now[:error] = "No such superpower!"
      else
        @heroines
      end
    end
    render :index
  end
  def show
    @heroine = Heroine.find(params[:id])
  end
  def new
    @heroine = Heroine.new
  end
  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to heroine_path(@heroine)
    else
      #add error
      render :new
    end
  end
  private
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
  def superpower_param
    params.permit(:power, :commit)
  end
end

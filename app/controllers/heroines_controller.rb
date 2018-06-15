class HeroinesController < ApplicationController

  def index
    if params[:power]
      @heroine = Heroine.where('power LIKE ?', "%#{params[:power]}%")
    else
      @heroines = Heroine.all
    end
  end

  def new
    @heroine = Heroine.new
    render :new
  end

  def create
    @heroine = Heroine.create(heroine_params)

    redirect_to heroine_path(@heroine)
  end

  def show
    @heroine = find_heroine
    render :show
  end

  private
  def find_heroine
    @heroine = Heroine.find(params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:power, :name, :super_name, :power_id)
  end
end

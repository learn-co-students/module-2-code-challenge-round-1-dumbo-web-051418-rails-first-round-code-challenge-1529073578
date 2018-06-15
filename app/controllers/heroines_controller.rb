class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def new
    @heroine = Heroine.new
    render :new
  end

  def create

    @heroine = Heroine.create(heroine_params)
    if @heroine.valid?
      redirect_to @heroine
    else
      render :new
    end
  end


  def show
    @heroine = Heroine.find(params[:id])
    render :show
  end

  def search
    @projects = Project.search(params[:search])
    render :index
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end

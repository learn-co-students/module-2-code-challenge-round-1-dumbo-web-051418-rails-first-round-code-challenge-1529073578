class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
    # couldn't implement in time: Trouble getting the params to pass to either the controller or my params private method
    if params[:super_power]
      @heroines = Heroine.powers.where('power LIKE ?', "%#{params[:super_power]}%")
    else
      @heroines = Heroine.all
    end
  end

  def show
    @heroine = find_id
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(set_params)
    if @heroine.save
      redirect_to heroine_path(@heroine)
    else
      render :new
    end
  end


  private

  def set_params

    params.require(:heroine).permit(:name,:super_name, :power_id, :super_power)

  end

  def find_id
    Heroine.find(params[:id])
  end
end

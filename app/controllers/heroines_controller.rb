class HeroinesController < ApplicationController
    def index
      @heroines = Heroine.all
    end

    def show
      @heroine = Heroine.find(params[:id])
      @powers = Power.all
    end

    def new
      @heroine = Heroine.new
    end

    def create
      heroine = Heroine.new(heroine_params)
      if heroine.valid?
      heroine.save
      redirect_to heroine_path(heroine)
      else
      show :new
      end
    end

    private

    def heroine_params
      params.require(:heroine).permit(:name, :super_name, :power_id)
      #the dropdown/collection select is going to have to pass power_id to this
    end

end

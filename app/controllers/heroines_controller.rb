class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def search
    #This action should be called when a superpower is searched
    #It should take in a parameter that is a power which can be used to FIND the power_id
    #Using the power_id, we can iterate through all the heroines and see if it matches their power_id
    #Once it's filtered through the iteration, we can display only the information that is true to the search
    # binding.pry
    render 'heroines/search.html.erb'
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
      render :new
    end
  end


  private
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end

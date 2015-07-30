class BootcampsController < ApplicationController
  def index
    @bootcamps = Bootcamp.all
  end

  def new
  end

  def create
    @bootcamp = Bootcamp.new(bootcamp_params)

    if @bootcamp.save
      redirect_to @bootcamp
    else
      render 'new'
    end
  end

  def show
    @bootcamp = Bootcamp.find(params[:id])
  end

  private
  def bootcamp_params
    params.require(:bootcamp).permit(:name, :rating)
  end
end

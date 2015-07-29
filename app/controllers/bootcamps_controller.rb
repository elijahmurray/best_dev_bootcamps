class BootcampsController < ApplicationController
  def index
    @bootcamps = Bootcamp.all
  end

  def new
  end

  def create
    @bootcamp = Bootcamp.new(bootcamp_params)

    @bootcamp.save
    redirect_to @bootcamp
  end

  def show
    @bootcamp = Bootcamp.find(params[:id])
  end

  private
  def bootcamp_params
    params.require(:bootcamp).permit(:name, :rating)
  end
end

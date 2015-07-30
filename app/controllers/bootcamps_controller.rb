class BootcampsController < ApplicationController
  def index
    @bootcamps = Bootcamp.all
  end

  def new
    @bootcamp = Bootcamp.new
  end

  def show
    @bootcamp = Bootcamp.find(params[:id])
  end

  def create
    @bootcamp = Bootcamp.new(bootcamp_params)

    if @bootcamp.save
      redirect_to @bootcamp
    else
      render 'new'
    end
  end

  def edit
    @bootcamp = Bootcamp.find(params[:id])
  end

  def update
    @bootcamp = Bootcamp.find(params[:id])
    if @bootcamp.update(bootcamp_params)
      redirect_to @bootcamp
    else
      render 'edit'
    end
  end

  private
  def bootcamp_params
    params.require(:bootcamp).permit(:name, :rating)
  end
end

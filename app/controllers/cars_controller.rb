class CarsController < ApplicationController
  before_action :set_car, only: [:edit, :show, :update]

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def show
  end

  def create
    @car = Car.new(car_params)
    creation_message = "#{@car.year} #{@car.make} #{@car.model} created"
    if @car.save
      redirect_to cars_path,
                  :notice => creation_message
    else
      render :new
    end
  end

  def update
      if @car.update(car_params)
        redirect_to @car, notice: 'Car was successfully updated.'
      else
        render action: 'edit'
      end
  end

  def edit

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_car
    @car = Car.find(params[:id])
  end


  def car_params
    params.require(:car).permit([:year, :make, :model, :price])
  end

end

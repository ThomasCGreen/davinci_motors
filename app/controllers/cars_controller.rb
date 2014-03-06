class CarsController < ApplicationController

  def index

  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    creation_message = "#{@car.year} #{@car.make} #{@car.model} created"
    if @car.save
      redirect_to cars_path,
                  :notice => creation_message
    end
  end

  private
  def car_params
    params.require(:car).permit([:year, :make, :model, :price])
  end

end

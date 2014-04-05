class CarsController < ApplicationController
  before_action :set_car, only: [:edit, :show, :update, :claim]

  def index
    @cars = Car.where(user_id: nil)
  end

  def my_cars
    @cars = Car.where(user: current_user)
    render action: 'index'
  end

  def new
    @car = Car.new
  end

  def claim
    @car.user = current_user
    if @car.save
      redirect_to root_path, notice:
      "#{@car.make} #{@car.model} has been moved to your inventory"
    else
      redirect_to root_path, error: "Unable to claim car"
    end
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

class CarsController < ApplicationController
    skip_before_action :authorize_request, only: [:index, :show, :create, :update, :edit, :destroy]
    # Index action to list all cars
    def index
    cars = Car.includes(:photos).all
    render json: cars, each_serializer: CarSerializer
    end
  
    # Show action to display a single car and its photos
    def show
      car = Car.find(params[:id])
      render json: car
    end
  
    # New action to create a new car
    def new
      @car = Car.new
    end
  
    # Create action to save a new car to the database
    def create
      car = Car.new(car_params)
      if car.save
        render json: car
      else
        render 'Something went wrong try again!!.'
      end
    end
  
    # Edit action to update an existing car
    def edit
      @car = Car.find(params[:id])
    end
  
    # Update action to save changes to an existing car
    def update
      @car = Car.find(params[:id])
      if @car.update(car_params)
        redirect_to @car
      else
        render 'edit'
      end
    end
  
    # Destroy action to delete a car
    def destroy
      @car = Car.find(params[:id])
      @car.destroy
      redirect_to cars_path
    end
  
    private
  
    def car_params
      params.require(:car).permit(:make, :model, :year, :availability, :profile_image, photos_attributes: [:id, :image])
    end
  end
  
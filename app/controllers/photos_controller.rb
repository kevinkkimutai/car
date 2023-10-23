class PhotosController < ApplicationController
    skip_before_action :authorize_request, only: [:index, :show, :create, :update, :edit, :destroy]
    # Index action to list all photos
    def index
      photos = Photo.all
      render json: photos
    end
  
    # Show action to display a single photo
    def show
      @photo = Photo.find(params[:id])
    end
  
    # New action to create a new photo
    def new
      @photo = Photo.new
    end
  
    # Create action to save a new photo to the database
    def create
        photo = Photo.new(photo_params)
        if photo.save
          render json: photo
        else
          render json: { error: 'Something went wrong!!' }, status: :unprocessable_entity
        end
      end
      
  
    # Edit action to update an existing photo
    def edit
      @photo = Photo.find(params[:id])
    end
  
    # Update action to save changes to an existing photo
    def update
      @photo = Photo.find(params[:id])
      if @photo.update(photo_params)
        redirect_to @photo
      else
        render 'edit'
      end
    end
  
    # Destroy action to delete a photo
    def destroy
      @photo = Photo.find(params[:id])
      @photo.destroy
      redirect_to photos_path
    end
  
    private
  
    def photo_params
      params.require(:photo).permit(:image, :car_id)
    end
  end
  
class InstructorsController < ApplicationController
  before_action :set_instructor, only: [:show, :update, :destroy]

  # GET /instructors
  def index
    instructors = Instructor.all
    render json: instructors
  end

  # GET /instructors/:id
  def show
    render json: instructor
  end

  # POST /api/v1/instructors
  def create
    instructor = Instructor.new(instructor_params)

    if instructor.save
      render json: instructor, status: :created
    else
      render json: instructor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/instructors/:id
  def update
    if instructor.update(instructor_params)
      render json: instructor
    else
      render json: instructor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/instructors/:id
  def destroy
    instructor.destroy
    render json: { message: "Instructor successfully deleted" }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_instructor
    instructor = Instructor.find(params[:id])
    render json: instructor
  end

  # Only allow a trusted parameter "white list" through.
  def instructor_params
    params.require(:instructor).permit(:name, :email, :user_id)
  end
end

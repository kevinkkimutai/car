class FeedbacksController < ApplicationController
  skip_before_action :authorize_request, only: [:show, :update, :destroy, :create]
  
    # GET /feedbacks
    def index
      feedbacks = Feedback.all.map do |feedback|
        user = User.find(feedback.user_id)
        feedback.attributes.merge({ fullname: user.fullname })
      end
      render json: feedbacks
    end


   
    # GET /feedbacks/1
    def show
      render json: feedback
    end
  
    # POST /feedback
    def create
      feedback = Feedback.new(feedbacks_params)
  
      if feedback.save
        render json: feedback, status: :created, location: feedback
      else
        render json: feedback.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /feedbacks/1
    def update
      if feedback.update(feedback_params)
        render json: feedback
      else
        render json: feedback.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /feedbacks/1
    def destroy
      feedback.destroy
    end
  
    private
    def feedbacks_params
      params.permit(:user_id, :comment)
  
  end
    
end
  
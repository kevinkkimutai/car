class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
   before_action :authorize_request

  # Redirect users to appropriate root path after sign-in
  def after_sign_in_path_for(resource)
    if resource.student?
      student_root_path
    elsif resource.admin?
      admin_root_path
    else
      super
    end
  end

  private

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header

    begin
      decoded = JWT.decode(header, "secret", true, algorithm: 'HS256')
      @current_user_id = decoded[0]['user_id']
      @current_user = User.find(@current_user_id)
    rescue JWT::DecodeError
      render json: { error: 'Invalid token' }, status: :unauthorized
    end
  end
end

module Authenticate
  def current_user
    @current_user = User.find_By(access_token: params[:access_token])
  end
  
  def authenticate_with_token!
    render json: {errors: "Not authenticated", is_success: false}, status: :unauthorized unless current_user.present? 
  end
end
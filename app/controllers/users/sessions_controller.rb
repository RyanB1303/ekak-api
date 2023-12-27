class Users::SessionsController < Devise::SessionsController
  respond_to :json
  before_action :configure_sign_in_params, only: [:create]

  private

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nip])
  end

  def respond_with(_resource, _options = {})
    render json: {
      message: 'User Sign in successfully',
      data: current_user
    }, status: :ok
  end

  def respond_to_on_destroy
    if request.headers['Authorization'].nil?
      return render json: {
        message: 'User has no active session'
      }, status: :unauthorized
    end

    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],
                             Rails.application.credentials.fetch(:secret_key_base)).first
    current_user = User.find(jwt_payload['sub'])
    if current_user
      render json: {
        message: 'User Sign out successfully'
      }, status: :ok
    else
      render json: {
        message: 'User has no active session'
      }, status: :unauthorized
    end
  end
end

class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user!
  respond_to :json
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[nip email])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: %i[nip email])
  end

  def respond_with(resource, _options = {})
    if resource.persisted?
      render json: {
        message: 'Sign up success',
        data: resource
      }, status: :created
    else
      render json: {
               message: 'Sign up failed',
               errors: resource.errors.full_messages
             },
             status: :unprocessable_entity
    end
  end
end

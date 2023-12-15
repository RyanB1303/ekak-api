class Api::V1::AuthenticatedController < ApplicationController
  before_action :authenticate_user!

  private

  def authenticate_user!
    return if current_user

    render json: {
      errors: ['Bad Credentials']
    }, status: :unauthorized
  end
end

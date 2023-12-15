class Api::V1::AuthenticatedController < ApplicationController
  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  attr_reader :current_api_token, :current_user

  private

  def authenticate
    authenticate_user_with_token || handle_bad_authentication
  end

  def authenticate_user_with_token
    authenticate_with_http_token do |token, _options|
      current_api_token = ApiToken.where(active: true).find_by_token(token)
      @current_user = current_api_token&.user
    end
  end

  def handle_bad_authentication
    render json: { message: 'Bad credentials' }, status: :unauthorized
  end

  def handle_not_found
    render json: { message: 'Record not found' }, status: :not_found
  end
end

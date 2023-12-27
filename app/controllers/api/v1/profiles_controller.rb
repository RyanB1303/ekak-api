class Api::V1::ProfilesController < ApplicationController
  before_action :set_user
  before_action :set_profile, only: %i[show update destroy]

  # GET /users/:user_id/profiles
  def index
    @profiles = @user.profile

    render json: @profiles
  end

  # GET /profiles/1
  def show
    render json: @profile
  end

  # POST /profiles
  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      render json: @profile, status: :created,
             location: [:api, :v1, @user, @profile]
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /profiles/1
  def update
    if @profile.update(profile_params)
      render json: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /profiles/1
  def destroy
    @profile.destroy!
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = @user.profile
  end

  # Only allow a list of trusted parameters through.
  def profile_params
    params.require(:profile).permit(:nama, :user_id, :aktif)
  end
end

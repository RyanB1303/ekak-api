class Api::V1::TujuansController < ApplicationController
  before_action :set_tujuan, only: %i[show update destroy]

  # GET /tujuans
  def index
    @tujuans = Tujuan.all

    render json: @tujuans
  end

  # GET /tujuans/1
  def show
    render json: @tujuan
  end

  # POST /tujuans
  def create
    @tujuan = Tujuan.new(tujuan_params)

    if @tujuan.save
      render json: @tujuan, status: :created, location: [:api, :v1, @tujuan]
    else
      render json: @tujuan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tujuans/1
  def update
    if @tujuan.update(tujuan_params)
      render json: @tujuan
    else
      render json: @tujuan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tujuans/1
  def destroy
    @tujuan.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tujuan
    @tujuan = Tujuan.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tujuan_params
    params.require(:tujuan).permit(:tujuan, :tujuanable_id, :tujuanable_type)
  end
end

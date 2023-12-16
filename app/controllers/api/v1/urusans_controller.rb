class Api::V1::UrusansController < ApplicationController
  before_action :set_urusan, only: %i[show update destroy]

  # GET /urusans
  def index
    @urusans = Urusan.all

    render json: @urusans
  end

  # GET /urusans/1
  def show
    render json: @urusan
  end

  # POST /urusans
  def create
    @urusan = Urusan.new(urusan_params)

    if @urusan.save
      render json: @urusan, status: :created, location: [:api, :v1, @urusan]
    else
      render json: @urusan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /urusans/1
  def update
    if @urusan.update(urusan_params)
      render json: @urusan
    else
      render json: @urusan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /urusans/1
  def destroy
    @urusan.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_urusan
    @urusan = Urusan.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def urusan_params
    params.require(:urusan).permit(:urusan, :kode_urusan, :keterangan)
  end
end

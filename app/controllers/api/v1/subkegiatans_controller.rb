class Api::V1::SubkegiatansController < ApplicationController
  before_action :set_subkegiatan, only: %i[show update destroy]

  # GET /subkegiatans
  def index
    @subkegiatans = Subkegiatan.all

    render json: @subkegiatans
  end

  # GET /subkegiatans/1
  def show
    render json: @subkegiatan
  end

  # POST /subkegiatans
  def create
    @subkegiatan = Subkegiatan.new(subkegiatan_params)

    if @subkegiatan.save
      render json: @subkegiatan, status: :created, location: [:api, :v1, @subkegiatan]
    else
      render json: @subkegiatan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subkegiatans/1
  def update
    if @subkegiatan.update(subkegiatan_params)
      render json: @subkegiatan
    else
      render json: @subkegiatan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subkegiatans/1
  def destroy
    @subkegiatan.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_subkegiatan
    @subkegiatan = Subkegiatan.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def subkegiatan_params
    params.require(:subkegiatan).permit(:subkegiatan, :kode_subkegiatan, :keterangan, :active)
  end
end

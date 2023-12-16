class KegiatansController < ApplicationController
  before_action :set_kegiatan, only: %i[ show update destroy ]

  # GET /kegiatans
  def index
    @kegiatans = Kegiatan.all

    render json: @kegiatans
  end

  # GET /kegiatans/1
  def show
    render json: @kegiatan
  end

  # POST /kegiatans
  def create
    @kegiatan = Kegiatan.new(kegiatan_params)

    if @kegiatan.save
      render json: @kegiatan, status: :created, location: @kegiatan
    else
      render json: @kegiatan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /kegiatans/1
  def update
    if @kegiatan.update(kegiatan_params)
      render json: @kegiatan
    else
      render json: @kegiatan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /kegiatans/1
  def destroy
    @kegiatan.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kegiatan
      @kegiatan = Kegiatan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kegiatan_params
      params.require(:kegiatan).permit(:kegiatan, :kode_kegiatan, :keterangan, :active)
    end
end

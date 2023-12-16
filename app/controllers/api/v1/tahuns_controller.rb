class Api::V1::TahunsController < ApplicationController
  before_action :set_tahun, only: %i[show update destroy]

  # GET /tahuns
  def index
    @tahuns = Tahun.all

    render json: @tahuns
  end

  # GET /tahuns/1
  def show
    render json: @tahun
  end

  # POST /tahuns
  def create
    @tahun = Tahun.new(tahun_params)

    if @tahun.save
      render json: @tahun, status: :created, location: [:api, :v1, @tahun]
    else
      render json: @tahun.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tahuns/1
  def update
    if @tahun.update(tahun_params)
      render json: @tahun
    else
      render json: @tahun.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tahuns/1
  def destroy
    @tahun.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tahun
    @tahun = Tahun.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tahun_params
    params.require(:tahun).permit(:tahun, :kelompok_anggaran, :keterangan, :periode_id)
  end
end

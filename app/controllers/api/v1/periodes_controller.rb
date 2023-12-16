class Api::V1::PeriodesController < ApplicationController
  before_action :set_periode, only: %i[show update destroy]

  # GET /periodes
  def index
    @periodes = Periode.all

    render json: @periodes
  end

  # GET /periodes/1
  def show
    render json: @periode
  end

  # POST /periodes
  def create
    @periode = Periode.new(periode_params)

    if @periode.save
      render json: @periode, status: :created, location: [:api, :v1, @periode]
    else
      render json: @periode.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /periodes/1
  def update
    if @periode.update(periode_params)
      render json: @periode
    else
      render json: @periode.errors, status: :unprocessable_entity
    end
  end

  # DELETE /periodes/1
  def destroy
    @periode.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_periode
    @periode = Periode.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def periode_params
    params.require(:periode).permit(:tahun_awal, :tahun_akhir, :keterangan, :nama_periode, :lembaga_id)
  end
end

class Api::V1::OpdsController < ApplicationController
  before_action :set_opd, only: %i[show update destroy]

  # GET /opds
  def index
    @opds = Opd.all

    render json: @opds
  end

  # GET /opds/1
  def show
    render json: @opd
  end

  # POST /opds
  def create
    @opd = Opd.new(opd_params)

    if @opd.save
      render json: @opd, status: :created, location: [:api, :v1, @opd]
    else
      render json: @opd.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /opds/1
  def update
    if @opd.update(opd_params)
      render json: @opd
    else
      render json: @opd.errors, status: :unprocessable_entity
    end
  end

  # DELETE /opds/1
  def destroy
    @opd.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_opd
    @opd = Opd.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def opd_params
    params.require(:opd).permit(:nama_opd, :kode_opd, :active, :lembaga_id)
  end
end

class Api::V1::IndikatorsController < ApplicationController
  before_action :set_indikator, only: %i[show update destroy]

  # GET /indikators
  def index
    @indikators = Indikator.all

    render json: @indikators
  end

  # GET /indikators/1
  def show
    render json: @indikator
  end

  # POST /indikators
  def create
    @indikator = Indikator.new(indikator_params)

    if @indikator.save
      render json: @indikator, status: :created, location: [:api, :v1, @indikator]
    else
      render json: @indikator.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /indikators/1
  def update
    if @indikator.update(indikator_params)
      render json: @indikator
    else
      render json: @indikator.errors, status: :unprocessable_entity
    end
  end

  # DELETE /indikators/1
  def destroy
    @indikator.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_indikator
    @indikator = Indikator.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def indikator_params
    params.require(:indikator).permit(:indikator, :indikatorable_type, :indikatorable_id, :keterangan)
  end
end

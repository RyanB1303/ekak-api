class StrategicsController < ApplicationController
  before_action :set_strategic, only: %i[show update destroy]

  # GET /strategics
  def index
    @strategics = Strategic.all

    render json: @strategics
  end

  # GET /strategics/1
  def show
    render json: @strategic
  end

  # POST /strategics
  def create
    @strategic = Strategic.new(strategic_params)

    if @strategic.save
      render json: @strategic, status: :created, location: @strategic
    else
      render json: @strategic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /strategics/1
  def update
    if @strategic.update(strategic_params)
      render json: @strategic
    else
      render json: @strategic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /strategics/1
  def destroy
    @strategic.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_strategic
    @strategic = Strategic.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def strategic_params
    params.require(:strategic).permit(:strategi, :keterangan, :tahun_id, :opd_id, :from_kota, :parent_id)
  end
end

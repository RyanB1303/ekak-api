class Api::V1::PohonsController < ApplicationController
  before_action :set_pohon, only: %i[show update destroy]

  # GET /api/v1/pohons
  def index
    @pohons = Pohon.all

    render json: @pohons
  end

  # GET /api/v1/pohons/1
  def show
    render json: @pohon
  end

  # POST /api/v1/pohons
  def create
    @pohon = Pohon.new(pohon_params)

    if @pohon.save
      render json: @pohon, status: :created, location: [:api, :v1, @pohon]
    else
      render json: @pohon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/pohons/1
  def update
    if @pohon.update(pohon_params)
      render json: @pohon
    else
      render json: @pohon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/pohons/1
  def destroy
    @pohon.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pohon
    @pohon = Pohon.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def pohon_params
    params.require(:pohon).permit(:pohonable_id, :pohonable_type, :keterangan, :tahun_id, :parent_id)
  end
end

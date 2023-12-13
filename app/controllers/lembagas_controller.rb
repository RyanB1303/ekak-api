class LembagasController < ApplicationController
  before_action :set_lembaga, only: %i[ show update destroy ]

  # GET /lembagas
  def index
    @lembagas = Lembaga.all

    render json: @lembagas
  end

  # GET /lembagas/1
  def show
    render json: @lembaga
  end

  # POST /lembagas
  def create
    @lembaga = Lembaga.new(lembaga_params)

    if @lembaga.save
      render json: @lembaga, status: :created, location: @lembaga
    else
      render json: @lembaga.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lembagas/1
  def update
    if @lembaga.update(lembaga_params)
      render json: @lembaga
    else
      render json: @lembaga.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lembagas/1
  def destroy
    @lembaga.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lembaga
      @lembaga = Lembaga.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lembaga_params
      params.require(:lembaga).permit(:nama_lembaga, :kode_lembaga, :status)
    end
end

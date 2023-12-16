class BidangUrusansController < ApplicationController
  before_action :set_bidang_urusan, only: %i[ show update destroy ]

  # GET /bidang_urusans
  def index
    @bidang_urusans = BidangUrusan.all

    render json: @bidang_urusans
  end

  # GET /bidang_urusans/1
  def show
    render json: @bidang_urusan
  end

  # POST /bidang_urusans
  def create
    @bidang_urusan = BidangUrusan.new(bidang_urusan_params)

    if @bidang_urusan.save
      render json: @bidang_urusan, status: :created, location: @bidang_urusan
    else
      render json: @bidang_urusan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bidang_urusans/1
  def update
    if @bidang_urusan.update(bidang_urusan_params)
      render json: @bidang_urusan
    else
      render json: @bidang_urusan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bidang_urusans/1
  def destroy
    @bidang_urusan.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bidang_urusan
      @bidang_urusan = BidangUrusan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bidang_urusan_params
      params.require(:bidang_urusan).permit(:bidang_urusan, :kode_bidang_urusan, :keterangan)
    end
end

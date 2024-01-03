module Api
  module V1
    class KelompokAnggaransController < ApplicationController
      before_action :set_kelompok_anggaran, only: %i[show update destroy]

      # GET /kelompok_anggarans
      def index
        @kelompok_anggarans = KelompokAnggaran.all

        render json: @kelompok_anggarans
      end

      # GET /kelompok_anggarans/1
      def show
        render json: @kelompok_anggaran
      end

      # POST /kelompok_anggarans
      def create
        @kelompok_anggaran = KelompokAnggaran.new(kelompok_anggaran_params)

        if @kelompok_anggaran.save
          render json: @kelompok_anggaran, status: :created, location: [:api, :v1, @kelompok_anggaran]
        else
          render json: @kelompok_anggaran.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /kelompok_anggarans/1
      def update
        if @kelompok_anggaran.update(kelompok_anggaran_params)
          render json: @kelompok_anggaran
        else
          render json: @kelompok_anggaran.errors, status: :unprocessable_entity
        end
      end

      # DELETE /kelompok_anggarans/1
      def destroy
        @kelompok_anggaran.destroy!
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_kelompok_anggaran
        @kelompok_anggaran = KelompokAnggaran.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def kelompok_anggaran_params
        params.require(:kelompok_anggaran).permit(:nama_kelompok, :keterangan, :lembaga_id, :tahun_id)
      end
    end
  end
end

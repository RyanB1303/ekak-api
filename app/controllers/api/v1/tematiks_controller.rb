module Api
  module V1
    class TematiksController < ApplicationController
      before_action :set_tematik, only: %i[show update destroy]

      # GET /api/v1/tematiks
      def index
        @tematiks = Tematik.all

        render json: @tematiks
      end

      # GET /api/v1/tematiks/1
      def show
        render json: @tematik
      end

      # POST /api/v1/tematiks
      def create
        @tematik = Tematik.new(tematik_params)

        if @tematik.save
          render json: @tematik, status: :created, location: [:api, :v1, @tematik]
        else
          render json: @tematik.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/tematiks/1
      def update
        if @tematik.update(tematik_params)
          render json: @tematik
        else
          render json: @tematik.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/tematiks/1
      def destroy
        @tematik.destroy!
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_tematik
        @tematik = Tematik.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def tematik_params
        params.require(:tematik).permit(:tematik, :keterangan, :tahun_id, :level, :parent_id)
      end
    end
  end
end

# frozen_string_literal: true

module Api
  module V1
    class ReservationsController < ApplicationController
      def index
        render json: Reservation.where(user_id: @current_user.id), status: 201
      end

      def all_reservations
        if @current_user.role && @current_user.role.downcase == 'admin'
          render json: Reservation.all, status: 201
        else
          render json: { data: 'ooops, you are not autherized, contact your admin' }, status: 404
        end
      end

      def create
        reservation = Reservation.new({ user_id: @current_user.id, **reservation_params })

        if reservation.save
          render json: reservation, status: 201
        else
          render json: reservation.errors, status: 503
        end
      end

      def show
        render json: find_reservation, status: 201
      end

      def destroy
        if @current_user.id == find_reservation.user_id || (@current_user.role && @current_user.role == 'admin')
          find_reservation.destroy
          render json: { data: 'record deleted successfully' }, status: 201
        else
          render json: { data: 'ooops, you are not autherized, contact' }, status: 404
        end
      end

      private

      def reservation_params
        params.permit(:return_date, :reservation_date, :city, :total_fee, :vehicle_id)
      end

      def find_reservation
        Reservation.find(params[:id])
      end
    end
  end
end

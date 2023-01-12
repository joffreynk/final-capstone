# frozen_string_literal: true

module Api
  module V1
    class VehiclesController < ApplicationController
      def index
        render json: Vehicle.order('created_at DESC'), status: 200
      end

      def create
        if @current_user.role && @current_user.role.downcase == 'admin'
          vehicle = Vehicle.new({ user_id: @current_user.id, **vehicle_params })
          if vehicle.save
            render json: vehicle, status: 200
          else
            render json: { errors: vehicle.errors.full_messages }, status: 503
          end
        else
          render json: { data: 'ooops, you are not autherized, contact your admin' },
                 status: 404
        end
      end

      def show
        render json: find_vehicle, status: 200
      end

      def destroy
        if @current_user.role && @current_user.role.downcase == 'admin'
          vehicle = find_vehicle
          if vehicle&.destroy
            render json: { data: 'vehicle deleted successfully' }, status: 200
          else
            render json: { errors: vehicle.errors.full_messages }, status: 503
          end
        else

          render json: { data: 'ooops, you are not autherized, contact your admin' },
                 status: 404
        end
      end

      private

      def vehicle_params
        params.permit(:name, :picture, :description, :pict, :price_per_day, :model, :color)
      end

      def find_vehicle
        Vehicle.find_by(id: params[:id])
      end
    end
  end
end

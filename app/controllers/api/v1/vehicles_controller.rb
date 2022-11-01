class Api::V1::VehiclesController < ApplicationController

  def index
  render json: Vehicle.all, status: 200

  end

  def create
    puts vehicle_params
    user = @current_user.id
    Vehicle.save({ user_id: @current_user.id, **vehicle_params })
    render json: { user_id: @current_user.id, **vehicle_params }, status: 200
  end

  def show

  end

  def destroy

  end


  private

  def vehicle_params
    params.permit(:name, :picture, :description, :price_per_day, :model, :color)
  end

end

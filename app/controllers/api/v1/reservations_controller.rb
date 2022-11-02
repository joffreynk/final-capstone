class Api::V1::ReservationsController < ApplicationController

  def index
    render json: Reservation.all, status: 201
  end

  def create

  end

  def show
  end

  def destroy
  end

  private

  def reserv_params
    params.permit(:return_date, :reservation_date, :city, :total_fee)
  end
end

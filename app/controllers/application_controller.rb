# frozen_string_literal: true

class ApplicationController < ActionController::API
  include JwtToken

  before_action :authenticate_user

  private

  def authenticate_user
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JwtToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
      puts "success login user"
    rescue ActiveRecord::RecordNotFound => e
      puts 'oooooooooooooooooohhhhh not found'
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      puts 'hohohohoohohohohohohohoh not found'
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end

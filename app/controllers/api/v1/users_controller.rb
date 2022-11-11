# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate_user, only: [:create]
      before_action :find_user, only: %i[show update destroy]
      include JwtToken

      def index
        users = User.all
        render json: users, status: 200
      end

      def create
        user = User.new(user_params)
        if user.save

          token = JwtToken.encode(user_id: user.id)
          time = Time.now + 24.hours.to_i
          render json: { token:, exp: time.strftime('%m-%d-%Y %H:%M'),
                         name: user.name, user_name: user.user_name, role: user.role }, status: 200
        else
          render json: { errors: user.errors.full_messages }, status: 503
        end
      end

      def destroy
        if @current_user.role && @current_user.role.downcase == 'admin'
          find_user.destroy
        else
          render json: { data: 'ooops, you are not autherized, contact your admin' }, status: 404
        end
      end

      private

      def user_params
        params.permit(:name, :user_name, :email, :password, :profile_picture, :role)
      end

      def find_user
        User.find(params[:id])
      end
    end
  end
end

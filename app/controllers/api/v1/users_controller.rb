# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate_user, only: [:create]
      before_action :find_user, only: %i[show update destroy]
      include JwtToken

      def index
        @users = User.all
        render json: @users, status: 200
      end

      def create
        userCreated = User.new(user_params)
        if userCreated.save

          token = JwtToken.encode(user_id: userCreated.id)
          time = Time.now + 24.hours.to_i
          render json: userCreated, status: 200
        else
          render json: { errors: userCreated.errors.full_messages }, status: 503
        end
      end

      def destroy
        if @current_user.role && @current_user.role.downcase == 'admin'
          @user.destroy
        else
          render json: { data: 'ooops, you are not autherized, contact yur admin' }, status: 404
        end
      end

      private

      def user_params
        params.permit(:name, :user_name, :email, :password, :profile_picture, :role)
      end

      def find_user
        @user = User.find(params[:id]) if params[:id].to_i.equal? @current_user.id
      end
    end
  end
end

# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate_user, only: [:create]
      before_action :find_user, only: %i[show update destroy]

      def index
        @users = User.all
        render json: @users, status: 200
      end

      def show
        if @user
          render json: @user, status: 200
        else
          render json: { error: "user is not logged in or doesn't exist" }, status: 404
        end
      end

      def create
        if @current_user.role.downcase == 'admin'
          @user = User.new(user_params)
          if @user.save
            render json: @user, status: 201
          else
            render json: { errors: @user.errors.full_messages }, status: 503
          end
        else
          render json: { data: 'ooops, you are not autherized, contact yur admin' }, status: 404
        end
      end

      def destroy
        if @current_user.role.downcase == 'admin'
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

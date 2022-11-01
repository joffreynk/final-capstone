class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]
  before_action :find_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users, status: 200
  end

  def show
    if @user
      render json: @user, status: 200
    else
      render json: {'error': "user is not logged in or doesn't exist"}, status: 404
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status:201
    else
      render json: {errors: @user.errors.full_messages}, status: 503
    end
  end

  def update
    unless @user.update(user_params)
      render json: {errors: @user.errors.full_messages}, status: 503
    end
  end

  def destroy
    @user.destroy
  end


  private

  def user_params
    params.permit(:name, :user_name, :email, :password, :profile_picture)
  end

  def find_user
    if params[:id].to_i === @current_user.id
      @user = User.find(params[:id])
    end
  end
  
end

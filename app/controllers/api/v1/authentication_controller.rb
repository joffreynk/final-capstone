class Api::V1::AuthenticationController < ApplicationController
  before_action :authenticate_user, except: :login
  include JwtToken

  # POST /auth/login
  def login
    @user = User.find_by(user_name: params[:user_name])
    puts @user
    if @user&.authenticate(params[:password])
      puts "caaaaallllllled"
      token = JwtToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     user_name: @user.user_name }, status: :ok
    else
      puts "noooooop nnnnooooop"
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:user_name, :password)
  end
end

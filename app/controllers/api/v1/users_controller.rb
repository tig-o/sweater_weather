class Api::V1::UsersController < ApplicationController
  def create
    if User.exists?(email: params[:email])
      render json: { message: "email already exists, try another" }, status: 400
    elsif params[:password] != params[:password_confirmation]
      render json: { message: "mismatching passwords, try again" }, status: 400
    else
      user = User.create!(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], api_key: SecureRandom.hex(13))
      render json: UserSerializer.display_user(user), status: 201
    end
    # private
    
    # def user_params
    #   params.permit(:email, :password, :password_confirmation)
    # end
  end
end
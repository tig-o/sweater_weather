class Api::V1::UsersController < ApplicationController
  def create
    if User.exists?(email: params[:email])
      render json: { message: "email already exists, try another" }, status: 400
    elsif params[:password] != params[:password_confirmation]
      render json: { message: "mismatching passwords, try again" }, status: 400
    elsif params[:email] == "" || params[:password] == "" || params[:password_confirmation] == ""
      render json: { message: "missing field(s), try again" }, status: 400
    elsif
      user = User.create!(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], api_key: SecureRandom.hex(13))
      render json: UserSerializer.display_user(user), status: 201
    end
  end

  def user_login
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      render json: Api::V1::UserSerializer.display_user(user)
    else
      render json: { message: "credentials are incorrect, try again" }, status: 401
    end
  end
end
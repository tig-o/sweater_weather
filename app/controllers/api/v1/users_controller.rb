class Api::V1::UsersController < ApplicationController
  def create
  
    user = User.create!(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], api_key: SecureRandom.hex(13))
    render json: UserSerializer.display_user(user), status: 201
    
    # private
    
    # def user_params
    #   params.permit(:email, :password, :password_confirmation)
    # end

  end
end
class TokensController < ApplicationController
  def verify
    @user = User.find_by(username: params[:username])
    @flag = @user.valid_password?(params[:password])
    logger.debug(@flag)
    logger.debug(params)


    if @flag
      @token = @user.access_token
      logger.debug(@token)
      render json: {token: @token}, status: 200
    else
      render status: 422
    end
  end


  def verify_token
    @user = User.find_by(access_token: params[:token])
    if @user
      render json: @user, status: 200
    else
      render json: @user.errors, status: 422
    end
  end
end

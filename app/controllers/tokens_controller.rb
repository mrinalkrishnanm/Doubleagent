class TokensController < ApplicationController
	skip_before_filter :verify_authenticity_token
	def verify
		@user = User.find_by(username: params[:user][:username])
        @flag = @user.valid_password?(params[:user][:password])


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

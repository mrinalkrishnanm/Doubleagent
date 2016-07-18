class UsersController < ApplicationController
  def index
    @users=User.all
    render json: @users, status: 200
  end

  def show
    @user=User.find(params[:id])
    render json: @users, status: 200
  end

  def create
    @user=User.new(user_params)
    if @user.save
      render json: @user, status: 200
    else
      logger.debug(@user.errors)
      render @user.errors, status: 422
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:first_name,:last_name,:username,:email,:password)
  end
end

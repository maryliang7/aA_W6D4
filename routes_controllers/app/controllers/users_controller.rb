class UsersController < ApplicationController
  def index
    debugger
    if params[:username]
      users = User.where(username: params[:username])
    else
      users = User.all
    end
    render json: users
  end

  def create
    user = User.new(user_params)
    user.save!
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user_params
    if user.update(user_params)
      render json: user 
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def destroy
    user = User.find(params[:id])
    
    if !users.include?(user)
      render json: "User not found"
    else
      user.destroy
      render json: User.all
    end
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end

end
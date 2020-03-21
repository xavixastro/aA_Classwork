class UsersController < ApplicationController

  def index 
    #debugger 
    if params[:id] 
      render json: User.find(params[:id]) 
    elsif params[:username]
      render json:  User.all.where(username: params[:username])
    else  
        render json: User.all 
    end 

  end 

  
  def show
    user = User.find(params[:id])
    render json:user
  end
  
  def update
    user = User.find(params[:id])
    #debugger 
    if user.update(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user 
    else  
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def destroy 
    user = User.find(params[:id])

    user.destroy 

    render json: user
  end 

  private 
  def user_params 
    params.require(:user).permit(:username)
  end 
  
end

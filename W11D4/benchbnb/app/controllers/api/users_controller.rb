require 'byebug'

class Api::UsersController < ApplicationController

    def create
        # byebug
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            render :show
        else
            render json: @user.errors.full_messages, status: 404
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end

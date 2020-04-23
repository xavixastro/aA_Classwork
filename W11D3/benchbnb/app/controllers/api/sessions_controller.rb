class Api::SessionsController < ApplicationController
    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user.nil?
            render json: ["invalid credentials"], status: 401
        else
            log_in!(@user)
            render 'api/users/show'
        end
    end

    def destroy
        if current_user
            log_out!
            render json: {}
        else
            render json: [ "Username not found" ], status: 404
        end
    end
end
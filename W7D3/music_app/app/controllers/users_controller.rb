class UsersController < ApplicationController

    before_action :require_logged_in, only: [:index]
    before_action :require_logged_out, only: [:create, :new]


    def new
        render :new
    end

    def create

        user = User.new(user_params)
        if user.save
            log_in_user!(user)
            redirect_to bands_url
        else
            redirect_to new_user_url
        end

    end

    def index
        render :index
    end

    
    
    
    private

    def user_params
        params.require(:user).permit(:email, :password)
    end

end

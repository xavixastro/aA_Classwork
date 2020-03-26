class SessionsController < ApplicationController

    before_action :require_logged_out, only: [:new, :create]

    def create
        user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )
        if user 
            log_in_user!(user)
            redirect_to bands_url
        else
            redirect_to new_session_url
        end

    end

    def new
        render :new
    end

    def destroy
        logout!
        redirect_to new_session_url
    end


end

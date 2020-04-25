class ApplicationController < ActionController::Base

    helper_method :current_user, :login!, :logout!, :logged_in?, :require_log_in


    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def login!(user)
        session[:session_token] = user.reset_session_token!
    end

    def logged_in?
        !!current_user
    end

    def logout!
        current_user.reset_session_token!
        session[:session_token] = nil
        @current_user = nil
    end

    def require_log_in
        redirect_to new_session_url unless logged_in?
    end


end

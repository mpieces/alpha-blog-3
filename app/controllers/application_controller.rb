class ApplicationController < ActionController::Base

     # makes available to views as well as al controllers
     helper_method :current_user, :logged_in?
     # to return the details of the user who is logged in
     def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]       
    end

     # will simply check if we have a user who is logged in 
     def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:alert] = "You must be logged in to perform that action."
            redirect_to login_path
        end
    
    end


end

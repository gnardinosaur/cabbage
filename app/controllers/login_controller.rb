class LoginController < ApplicationController 

    def new
    end
    
    def sign_in                                  #this method creates a new login session and sets session[:user_id] for use in ApplicationController
        user = User.find_by(username: params[:username])
    
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id

            redirect_to user_path(user)
        else
            flash[:message] = "Try Again."

            redirect_to root_path
        end
    end
    
    def destroy
        session[:user_id] = nil
        
        redirect_to root_path
    end

end
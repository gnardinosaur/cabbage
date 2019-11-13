class ApplicationController < ActionController::Base
    before_action :logged_in_check

    def logged_in_check
        if session[:user_id]
            @logged_in_user = User.find(session[:user_id])
        end
    end

end

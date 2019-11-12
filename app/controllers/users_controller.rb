class UsersController < ApplicationController

    def index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        @user.balance = 0
        @user.save 
        
        redirect_to user_path(@user)
    end

    def show
        @user = User.find(params[:id])
    end

    private 
    
    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :password)
    end
    
end


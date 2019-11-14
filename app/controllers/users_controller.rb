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
        session[:user_id] = @user.id
        
        redirect_to user_path(@user)
    end

    def show
    end

    def update
        @user = User.find(params[:id])

        if params[:add_cash]                        #adds amount to user cash balance
            @user.balance += params[:add_cash].to_i
            @user.save
        elsif params[:withdraw_cash]                #removes amount from user cash balance
            @user.balance -= params[:withdraw_cash].to_i
            @user.save
        end

        redirect_to user_path(@user)
    end

    private 
    
    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :password)
    end
    
end


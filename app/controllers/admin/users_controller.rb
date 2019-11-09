class Admin::UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to admin_user_path
        else
            render :edit
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to admin_users_path
    end

    def out
        @user = User.find(params[:id])
    end

    private
    def user_params
        params.require(:user).permit(:name, :email)
    end
end

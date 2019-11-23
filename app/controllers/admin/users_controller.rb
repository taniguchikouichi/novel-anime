class Admin::UsersController < ApplicationController
    # before_action :authenticate_admin!
    PER = 20
    
    def index
        @users = User.page(params[:page]).per(PER)
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
            flash[:user] = "ユーザーを編集しました。"
            redirect_to admin_users_path
        else
            render :edit
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:user] = "ユーザーを削除しました。"
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

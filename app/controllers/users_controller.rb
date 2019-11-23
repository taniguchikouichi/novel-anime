class UsersController < ApplicationController
    before_action :authenticate_user!


    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:user] = "名前を変更しました。"
            redirect_to novels_path
        else
            render :edit
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy 
        flash[:user] = "退会しました。"
        redirect_to novels_path
    end
    

    private
    def user_params
        params.require(:user).permit(:name, :email)
    end
end

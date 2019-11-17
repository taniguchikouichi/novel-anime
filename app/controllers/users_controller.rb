class UsersController < ApplicationController

    def show
    end

    def edit
    end

    def update
    end

    def out
    end

    def destroy
    end

    private
    def user_params
        params.require(:user).permit(:name, :email)
    end
end

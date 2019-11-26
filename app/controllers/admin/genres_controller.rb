class Admin::GenresController < ApplicationController
    before_action :authenticate_admin!
    PER = 20
    def new
        @genre = Genre.new
    end

    def index
        @genres = Genre.page(params[:page]).per(PER)
    end

    def create
        @genre = Genre.new(genre_params)
        if @genre.save
            flash[:genre] = "ジャンルを作成しました。"
            redirect_to admin_genres_path
        else
            render :new
        end
    end

    def destroy
        genre = Genre.find(params[:id])
        genre.destroy
        flash[:genre] = "ジャンルを削除しました。"
        redirect_to admin_genres_path
    end
    private
    def genre_params
        params.require(:genre).permit(:genre_name)
    end
end

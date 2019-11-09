class Admin::GenresController < ApplicationController
    def new
        @genre = Genre.new
    end

    def index
        @genres = Genre.all
    end

    def create
        @genre = Genre.new(genre_params)
        if @genre.save
            redirect_to admin_genres_path
        else
            render :new
        end
    end

    def destroy
        genre = Genre.find(params[:id])
        genre.destroy
        redirect_to admin_genres_path
    end
    private
    def genre_params
        params.require(:genre).permit(:genre_name)
    end
end

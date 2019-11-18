class NovelsController < ApplicationController
    def index
        @novels = Novel.all
    end
    
    def show
        @novel = Novel.find(params[:id])
    end

    def favorite
        novel = Novel.find(params[:id])
        if novel.favorited_by?(current_user)
            favorite = current_user.favorites.find_by(novel_id: novel.id)
            favorite.destroy
            render json: novel.id
        else
            favorite = current_user.favorites.new(novel_id: novel.id)
            favorite.save
            render json: novel.id
        end
    end
end

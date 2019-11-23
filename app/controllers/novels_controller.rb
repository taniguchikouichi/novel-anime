class NovelsController < ApplicationController
    PER = 10


    def index
        @novels = Novel.page(params[:page]).per(PER)
        @q = Novel.ransack(params[:q])
        @novels = @q.result(distinct: true)
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

    def ranks
        @rank = Novel.find(Favorite.group(:novel_id).order('count(novel_id) desc').limit(10).pluck(:novel_id))
        @rate_rank = Novel.find(Review.group(:novel_id).order('avg("story_rate") + avg("person_rate") + avg("production_rate") + avg("setting_rate") desc').limit(10).pluck("novel_id"))
    end

    def search
        @q = Novel.ransack(search_params)
        @novels = @q.result(distinct: true)
    end

    private
    def search_params
        params.require(:q).permit!
    end
end

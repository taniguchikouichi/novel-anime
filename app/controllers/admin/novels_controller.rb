class Admin::NovelsController < ApplicationController
    def new
        @novel = Novel.new
    end

    def index
        @novels = Novel.all
    end

    def show
        @novel = Novel.find(params[:id])
    end

    def edit
        @novel = Novel.find(params[:id])
    end

    def create
        @novel = Novel.new(novel_params)
        if @novel.save
            redirect_to admin_novel_path(@novel)
        else
            render :new
        end
    end

    def update
        novel = Novel.find(params[:id])
        GenreCombination.where(novel_id:params[:id]).destroy_all
        if novel.update(novel_params)
            redirect_to admin_novel_path(novel)
        else
            render :edit
        end
    end

    def destroy
        novel = Novel.find(params[:id])
        novel.destroy
        redirect_to admin_novels_path
    end
    private
    def novel_params
        params.require(:novel).permit(:label_id, :story_id, :production_id,
                                        :setting_id, :persozn_id, :title, :explanation, :url,
                                        genre_combinations_attributes: [:id, :genre_id, :_destroy])
    end
    
end

class Admin::ReviewsController < ApplicationController
    # before_action :authenticate_admin!
    PER = 10
    def index
        @reviews = Review.page(params[:page]).per(PER)
    end

    def edit
        @review = Review.find(params[:id])
    end

    def update
        @novel = Novel.find(params[:novel_id])
        review = Review.find(params[:id])
        if review.update(review_params)
            flash[:review] = "レビューを編集しました。"
            redirect_to admin_novel_reviews_path
        else
            render :edit
        end
    end

    def destroy
        @novel = Novel.find(params[:novel_id])
        review = Review.find(params[:id])
        review.destroy
        flash[:review] = "レビューを削除しました。"
        redirect_to admin_novel_reviews_path
    end

    private 
    def review_params
        params.require(:review).permit(:id, :title, :text, :story_rate, :production_rate, :setting_rate, :person_rate)
    end
end



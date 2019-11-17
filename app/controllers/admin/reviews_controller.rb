class Admin::ReviewsController < ApplicationController
    def index
        @reviews = Review.all
    end

    def edit
        @review = Review.find(params[:id])
    end

    def update
        @novel = Novel.find(params[:novel_id])
        review = Review.find(params[:id])
        if review.update(review_params)
            redirect_to admin_novel_reviews_path
        else
            render :edit
        end
    end

    def destroy
        @novel = Novel.find(params[:novel_id])
        review = Review.find(params[:id])
        review.destroy
        redirect_to admin_novel_reviews_path
    end

    private 
    def review_params
        params.require(:review).permit(:id, :title, :text, :story_rate, :production_rate, :setting_rate, :person_rate)
    end
end



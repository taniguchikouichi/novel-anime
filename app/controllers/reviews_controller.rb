class ReviewsController < ApplicationController
    before_action :authenticate_user!

    def index
        @reviews = Review.all
        @novel = Novel.find(params[:novel_id])
    end


    def new
        @review = Novel.find(params[:novel_id]).reviews.new
    end
    
    def edit
        @review = Review.find(params[:id])
    end

    def create
        @novel = Novel.find(params[:novel_id])
        @review = current_user.reviews.new(review_params)
        @review.novel_id = @novel.id
        if @review.save
            redirect_to novel_reviews_path
        else
            render :new
        end
    end
    
    def update
        @novel = Novel.find(params[:novel_id])
        review = Review.find(params[:id])
        if review.update(review_params)
            redirect_to novel_reviews_path
        else
            render :edit
        end
    end

    def destroy
        @novel = Novel.find(params[:novel_id])
        review = Review.find(params[:id])
        review.destroy
        redirect_to novel_reviews_path
    end

    private 
    def review_params
        params.require(:review).permit(:id, :title, :text, :story_rate, :production_rate, :setting_rate, :person_rate)
    end
end

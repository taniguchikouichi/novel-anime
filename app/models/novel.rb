class Novel < ApplicationRecord
    validates :title, :explanation, :url, presence: true
    belongs_to :label
    has_many :reviews
    has_many :favorites, dependent: :destroy
    has_many :genre_combinations
    has_many :genres, through: :genre_combinations
    accepts_nested_attributes_for :genre_combinations, reject_if: :all_blank, allow_destroy: true

    attr_accessor :average

    def average_story
        self.reviews.sum(:story_rate) / self.reviews.length
    end

    def average_production
        self.reviews.sum(:production_rate) / self.reviews.length
    end

    def average_person
        self.reviews.sum(:person_rate) / self.reviews.length
    end

    def average_setting
        self.reviews.sum(:setting_rate) / self.reviews.length
    end

    def total_average
        total_average = (average_story + average_production + average_person + average_setting)/4
    end


    def favorited_by?(user) #いいねしているかどうか
        favorites.where(user_id: user.id).exists?
    end

    

end

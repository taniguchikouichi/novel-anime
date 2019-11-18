class Novel < ApplicationRecord
    belongs_to :label
    has_many :reviews
    has_many :favorites, dependent: :destroy
    has_many :genre_combinations
    has_many :genres, through: :genre_combinations
    accepts_nested_attributes_for :genre_combinations, reject_if: :all_blank, allow_destroy: true

    def favorited_by?(user) #いいねしているかどうか
        favorites.where(user_id: user.id).exists?
    end
end

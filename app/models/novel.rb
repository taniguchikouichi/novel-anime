class Novel < ApplicationRecord
    belongs_to :label
    has_many :reviews
    has_many :favorites
    has_many :genre_combinations
    has_many :genres, through: :genre_combinations
    accepts_nested_attributes_for :genre_combinations, reject_if: :all_blank, allow_destroy: true
end

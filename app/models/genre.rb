class Genre < ApplicationRecord
    validates :genre_name, presence: true
    has_many :genre_combinations
    has_many :novels, through: :genre_combinations
    accepts_nested_attributes_for :genre_combinations, reject_if: :all_blank　, allow_destroy: true
end
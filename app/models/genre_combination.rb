class GenreCombination < ApplicationRecord
    belongs_to :genre
    belongs_to :novel
end

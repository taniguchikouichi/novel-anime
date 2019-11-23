class Review < ApplicationRecord
    validates :title, :text, :story_rate, :production_rate, :setting_rate, :person_rate, presence: true
    belongs_to :user
    belongs_to :novel
# 総合評価
    def total_rate
        total_rate = (story_rate + production_rate + setting_rate + person_rate) / 4
    end
# ここまで


end

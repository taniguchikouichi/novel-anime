class Review < ApplicationRecord
# 総合評価
    def total_rate
        total_rate = (story_rate + production_rate + setting_rate + person_rate) / 4
    end
# ここまで

    belongs_to :user
    belongs_to :novel


end

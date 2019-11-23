FactoryBot.define do
  factory :genre_combination do
    association :novel, factory: :novel
    association :genre, factory: :genre
  end
end

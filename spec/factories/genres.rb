FactoryBot.define do
  factory :genre do
    sequence(:genre_name) { |n| "genre_name#{n}" }

    trait :genre_name do
        no_genre_name{}
    end
    
  end
end

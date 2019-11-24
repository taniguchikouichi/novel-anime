FactoryBot.define do
  factory :genre do
    genre_name { "genre_name" }

    trait :no_genre_name do
      genre_name{}
    end
    
  end
end

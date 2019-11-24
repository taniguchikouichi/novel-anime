FactoryBot.define do
  factory :user do
      email { "example@test.com" }
      name { "test" }
      password { password }
      password_confirmation { password }
  
      trait :no_name do
        name {test}
      end
      trait :create_with_reviews do
        after(:create) do |user|
          create_list(:review, 3, user: user)
        end
      end
  end
end

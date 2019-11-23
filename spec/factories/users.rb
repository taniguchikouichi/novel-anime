FactoryBot.define do
  factory :user do
      sequence(:email) { |n| "example#{n}@test.com" }
      sequence(:name) { |n| "name#{n}" }
      sequence(:introduction) { |n| "introduction#{n}" }
      password { password }
      password_confirmation { password }
  
      trait :no_name do
        name {}
      end
  end
end

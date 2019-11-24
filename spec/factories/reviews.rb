FactoryBot.define do
  factory :review do
    title { "テスト" }
    text  { "テスト" }
    story_rate { 1 }
    production_rate { 1 }
    person_rate { 1 }
    setting_rate { 1 }
    association :user, factory: :user
    association :novel, factory: :novel

      # trait :with_test_user do
      #   association :user, :test_name
      #   name { "testtest" }
      #   email { "test@test" }
      #   password { "password" }
      #   sign_in_count { 1 }
      #   id { 6 }
      # end
      trait :no_title do
          title{}
      end
      trait :no_text do
          text{}
      end
      trait :no_story_rate do
        story_rate{}
      end
      trait :no_production_rate do
        production_rate{}
      end
      trait :no_person_rate do
        person_rate{}
      end
      trait :no_setting_rate do
        setting_rate{}
      end
  end
end

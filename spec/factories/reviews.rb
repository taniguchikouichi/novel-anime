FactoryBot.define do
  factory :review do
    sequence(:title) { |n| "title#{n}" }
    sequence(:text) { |n| "text#{n}" }
    sequence(:story_rate) { |n| "story_rate#{n}" }
    sequence(:production_rate) { |n| "production_rate#{n}" }
    sequence(:person_rate) { |n| "person_rate#{n}" }
    sequence(:setting_rate) { |n| "setting_rate#{n}" }
    association :user, factory: :user
    association :novel, factory: :novel


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

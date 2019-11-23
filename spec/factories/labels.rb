FactoryBot.define do
  factory :label do
      sequence(:label_name) { |n| "label_name#{n}" }

      trait :no_label_name do
          label_name{}
      end

      trait :create_with_novels do
          after(:create) do |label|
          create_list(:novel, 3, label: label)
          end
      end

  end
end

FactoryBot.define do
    factory :label do
        label_name { "label_name" }
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

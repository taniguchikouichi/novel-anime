FactoryBot.define do
  factory :favorite do
    association :user, factory: :user
    association :novel, factory: :novel
  end
end

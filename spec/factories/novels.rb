FactoryBot.define do
  factory :novel do
    title { 'テストタイトル' }
    explanation { 'テストあらすじ' }

    association :label, factory: :label
    trait :no_title do
      title{}
    end

    trait :no_explanation do
      explanation{}
    end
    
  end
end

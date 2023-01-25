FactoryBot.define do
  factory :package do
    width { 1 }
    weight { 1 }
    length { 1 }
    height { 1 }

    trait :invalid do
      width { nil }
    end
  end
end

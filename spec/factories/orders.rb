FactoryBot.define do
  factory :order do
    weight { 1 }
    length { 1 }
    width { 1 }
    height { 1 }
    departure_point { "Moscow" }
    destination { "Tyumen" }

    trait :invalid do
      weight { nil }
    end
  end
end

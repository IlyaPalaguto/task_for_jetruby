FactoryBot.define do
  factory :order do
    weight { 1 }
    length { 1 }
    width { 1 }
    height { 1 }
    departure_point { "MyString" }
    destination { "MyString" }
  end
end

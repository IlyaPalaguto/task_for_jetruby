FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "sample#{n}@mail.com"
    end
    factory :user do
      email
      password { 'qwer1234' }
      password_confirmation { 'qwer1234' }
      first_name { 'Ilia' }
      last_name { 'Palaguto' }
      phone_number { '79000000000' }
    end
  end
end

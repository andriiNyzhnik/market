FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.cell_phone }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end

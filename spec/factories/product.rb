FactoryBot.define do
  factory :product do
    name { 'name' }
    color { 'white' }
    description { 'test' }
    price { 2.34 }

    category
    brand

    trait :white do
      color { Colors::WHITE }
    end
  end
end

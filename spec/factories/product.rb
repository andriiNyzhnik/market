FactoryBot.define do
  factory :product do
    name { 'name' }
    color { 'white' }
    description { 'test' }
    price { 2.34 }

    product_type
    brand
  end
end
FactoryBot.define do
  factory :order do
    user
    status { Order.statuses[:draft] }
  end
end

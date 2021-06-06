FactoryBot.define do
  factory :invoice do
    status { rand(0..2) }
    customer_id { nil }
  end
end

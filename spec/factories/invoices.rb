FactoryBot.define do
  factory :invoice do
    status { rand(0..2) }
    customer_id { nil }
    created_at {Faker::Date.in_date_period(month: 5)}
  end
end

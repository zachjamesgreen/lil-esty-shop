FactoryBot.define do
  factory :invoice_item do
    quantity { rand(0..100) }
    unit_price { rand(100..1000) }
  end
end

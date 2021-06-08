FactoryBot.define do
  factory :invoice_item do
    quantity { rand(0..100) }
    unit_price { rand(100..1000) }
    status { rand(0..2) }
    invoice_id { nil }
    item_id { nil }
  end
end

FactoryBot.define do
  factory :bulk_discount do
    quantity_threshold { 1 }
    discount_percent { 1 }
    merchant { nil }
  end
end

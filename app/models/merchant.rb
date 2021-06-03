class Merchant < ApplicationRecord
  has_many :items

  def top_five
    a = Item.joins(invoices: :transactions)
    .group(:id)
    .where('transactions.result = 2')
    .select("items.*, sum(invoice_items.quantity * invoice_items.unit_price) as revenue")
    .order(revenue: :desc)
    .limit(5)
  end
end

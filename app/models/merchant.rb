class Merchant < ApplicationRecord
  has_many :items

  def top_five
    Item.joins(invoices: :transactions)
    .select("items.*, sum(invoice_items.quantity * invoice_items.unit_price) as revenue")
    .where(merchant_id: self.id)
    .where('transactions.result = 2')
    .group(:id)
    .order(revenue: :desc)
    .limit(5)
  end
end

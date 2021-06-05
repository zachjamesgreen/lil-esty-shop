class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  has_many :transactions, through: :invoices

  enum status: {disabled: 0, enabled:1}

  validates :name, :description, :unit_price, presence: true

  def top_day
    date_string = invoices.joins(:invoice_items)
    .select("invoices.*, sum(invoice_items.quantity * invoice_items.unit_price) as revenue")
    .where(status: 2)
    .group(:id)
    .order(revenue: :desc, created_at: :desc)
    .limit(1)
    .first
    .created_at
    date_string.to_date
  end
end

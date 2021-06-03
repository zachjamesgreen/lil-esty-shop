class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  enum status: {pending: 0, packaged: 1, shipped: 2}
  # enum status: [:pending, :packaged, :shipped]
  def self.merch_not_shipped(merch_id)
    select('invoice_items.*, merchants.id as merch_id, items.name as name, invoices.id as invoice_id')
    .joins(item: :merchant)
    .joins(:invoice)
    .where.not(status: 2)
    .where('merchants.id = ?', merch_id)
  end

  def formatted_time
    created_at.to_formatted_s(:long)[0..-6].strip
  end
end

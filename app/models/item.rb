class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  has_many :transactions, through: :invoices

  enum status: {disabled: 0, enabled:1}

  validates :name, :description, :unit_price, presence: true


  scope :from_merch, ->(merchant_id) {    
      select('merchants.id, items.*, invoice_items.quantity, invoice_items.status')
      .joins(invoice_items: :invoice)
      .where('merchants.id = ?', merchant_id )}
      
  def top_day
    limit = invoices.joins(:invoice_items).where(status: 2).count
    if limit >= 1
      date_string = invoices.joins(:invoice_items)
      .select("invoices.*, sum(invoice_items.quantity * invoice_items.unit_price) as revenue")
      .where(status: 2)
      .group(:id)
      .order(revenue: :desc, created_at: :desc)
      .limit(1)
      .first
      .created_at
      date_string.to_date
    else
      "Transactions Successful, but Invoices Pending/Cancelled"
    end
  end

  def self.from_merch(params)
    select(' items.*, invoice_items.*, items.status')
    .joins(invoice_items: :invoice)
    .where('invoices.id =?', params[:invoice_id])
    .where('items.merchant_id = ?', params[:id])
  end

  def convert_dollars
    unit_price.to_f/100
  end
end

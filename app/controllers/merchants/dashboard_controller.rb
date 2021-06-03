class Merchants::DashboardController < ApplicationController
  def index
    @merchant = Merchant.find(params[:id])
    @customers = Customer.select('customers.*, merchant_id, count(transactions) as trans_count, transactions.result')
    .joins(invoices: [{invoice_items: {item: :merchant}},:transactions])
    .group(:merchant_id, :id, 'transactions.result')
    .order(trans_count: :desc)
    .where('merchant_id = 10')
    .where('transactions.result = 2')
    .limit(5)
    @items_pending = InvoiceItem.merch_not_shipped(params[:id])
  end
end
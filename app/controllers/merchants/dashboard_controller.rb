class Merchants::DashboardController < ApplicationController
  def index
    @merchant = Merchant.find(params[:id])
    @customers = Customer.select('customers.*, merchant_id, count(transactions) as trans_count, transactions.result')
    .joins(invoices: [{invoice_items: {item: :merchant}},:transactions])
    .group(:merchant_id, :id, 'transactions.result')
    .order(trans_count: :desc)
    .where('merchant_id = 10')
    .where('transactions.result = 1')
  end
end
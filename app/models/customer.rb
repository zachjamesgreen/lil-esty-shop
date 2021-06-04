class Customer < ApplicationRecord
  has_many :invoices

  def self.top_5_customers_by_transactions
    select('customers.*, count(transactions.id) as transaction_count, transactions.result')
      .joins(invoices: :transactions)
      .where('transactions.result': 1)
      .group('customers.id', 'transactions.result')
      .order(transaction_count: :desc)
      .limit(5)
    # select c.*, count(t.id) as transaction_count from customers as c
    # join invoices as i on c.id = i.customer_id
    # join transactions as t on i.id = t.invoice_id
    # where t.result = 2
    # group by c.id
    # order by transaction_count desc
    # limit 5;
#     Customer.select('customers.*, merchant.id').joins(invoices: [{invoice_items: {item: :merchant}}, :transactions]).group(:merchant)
#     Customer.select('customers.*, merchant_id, count(transactions) as trans_count, transactions.result').joins(invoices: [{invoice_items: {item: :merchant}}, :transactions]
# ).group(:merchant_id, :id).order(trans_count: :desc).where('merchant_id = 10').where('transactions.result = 2')
  end
end

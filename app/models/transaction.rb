# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :invoice

  enum result: { pending: 0, failed: 1, success: 2 }
end

# Item.joins(:transactions).select('items.*', 'sum(invoice_items.quantity * invoice_items.unit_price) as revenue', 'transactions.result').where(merchant_id: 2).where('transactions.result = ?', 2).group('transactions.result').group(:id)
#
# Item.joins(:transactions)
#     .select('items.*', 'sum(invoice_items.quantity * invoice_items.unit_price) as revenue', 'transactions.result')
#     .where(merchant_id: :id)
#     .where('transactions.result = 2')
#     .group('transactions.result')
#     .group('items.id')

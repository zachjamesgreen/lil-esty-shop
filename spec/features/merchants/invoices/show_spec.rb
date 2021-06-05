require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe 'merchant invoice show page' do
#   As a merchant
# When I visit my merchant invoice show page
# Then I see the total revenue that will be generated from all of my items on the invoice
  it 'shows the  total revenue that will be generated from all of my items on the invoice' do
    merchant_1 = Merchant.create!(name: 'Fake Merchant')

    item_1 = Item.crate!(name: 'first', description: 'number 1', unit_price: 100, merchant_id: merchant_1.id)
    item_2 = Item.crate!(name: 'second', description: 'number 2', unit_price: 200, merchant_id: merchant_1.id)
    item_3 = Item.crate!(name: 'third', description: 'number 3', unit_price: 300, merchant_id: merchant_1.id)

    customer_1 = Customer.create!(first_name: '1 cust', last_name: 'First cust')

    invoice_1 = Invoice.create!(status: 0, customer_id: customer_1.id)

    invoice_item_1 = InvoiceItem.create!(invoice_id: invoice_1.id, item_id: item_1.id, quantity: 1, unit_price: 100, status: 2)
    invoice_item_2 = InvoiceItem.create!(invoice_id: invoice_1.id, item_id: item_2.id, quantity: 1, unit_price: 200, status: 2)
    invoice_item_3 = InvoiceItem.create!(invoice_id: invoice_1.id, item_id: item_3.id, quantity: 1, unit_price: 300, status: 2)
    visit "merchants/#{merchant_1.id}/invoices/#{invoice_1.id}"
    save_and_open_page
    expect(page).to have_content("Invoice Revenue $123.0")
  end
end

# Get all item ids for one merchant
# item_ids = Merchant.first.items.pluck(:id)

# ii = InvoiceItem.select('sum(invoice_items.quantity * invoice_items.unit_price) as revenue')
# .where(item_id: item_ids)[0]

# ii.revenue

# # InvoiceItem.select('sum(invoice_items.quantity * invoice_items.unit_price) as revenue').where(invoice_id: 2)[0].revenue
# #this is the good one below!
# InvoiceItem.select('sum(invoice_items.quantity * invoice_items.unit_price) as revenue').where(invoice_id: 2)
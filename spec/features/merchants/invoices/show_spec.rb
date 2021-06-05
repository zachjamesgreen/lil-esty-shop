require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe 'merchant invoice show page' do
#   As a merchant
# When I visit my merchant invoice show page
# Then I see the total revenue that will be generated from all of my items on the invoice
  it 'shows the  total revenue that will be generated from all of my items on the invoice' do
    merchant_1 = Merchant.create!(name: 'Fake Merchant')

    item_1 = Item.create!(name: 'first', description: 'number 1', unit_price: 100, merchant_id: merchant_1.id)
    item_2 = Item.create!(name: 'second', description: 'number 2', unit_price: 200, merchant_id: merchant_1.id)
    item_3 = Item.create!(name: 'third', description: 'number 3', unit_price: 300, merchant_id: merchant_1.id)

    customer_1 = Customer.create!(first_name: '1 cust', last_name: 'First cust')

    invoice_1 = Invoice.create!(status: 0, customer_id: customer_1.id)

    invoice_item_1 = InvoiceItem.create!(invoice_id: invoice_1.id, item_id: item_1.id, quantity: 1, unit_price: 100, status: 2)
    invoice_item_2 = InvoiceItem.create!(invoice_id: invoice_1.id, item_id: item_2.id, quantity: 1, unit_price: 200, status: 2)
    invoice_item_3 = InvoiceItem.create!(invoice_id: invoice_1.id, item_id: item_3.id, quantity: 1, unit_price: 300, status: 2)
    visit "merchants/#{merchant_1.id}/invoices/#{invoice_1.id}"
    save_and_open_page
    expect(page).to have_content("Invoice Revenue $600.0")
  end
end

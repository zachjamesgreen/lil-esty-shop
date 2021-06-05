require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'validations' do
    it {should belong_to(:customer)}
    it {should have_many(:transactions)}
    it {should have_many(:invoice_items)}
    it {should have_many(:items).through(:invoice_items)}
  end

  describe 'class methods' do
    describe 'incomplete_invoices' do
      it 'gives invoices that are incomplete' do
        data = Invoice.incomplete_invoices
        expect(data.count).to eq 27
        test = data[0].created_at < data[1].created_at
        expect(test).to eq true
      end
    end
  end
  describe 'instance methods' do
    describe 'revenue' do
      it 'shows the revenue for an invoice' do
        merchant_1 = Merchant.create!(name: 'Fake Merchant')

        item_1 = Item.create!(name: 'first', description: 'number 1', unit_price: 100, merchant_id: merchant_1.id)
        item_2 = Item.create!(name: 'second', description: 'number 2', unit_price: 200, merchant_id: merchant_1.id)
        item_3 = Item.create!(name: 'third', description: 'number 3', unit_price: 300, merchant_id: merchant_1.id)

        customer_1 = Customer.create!(first_name: '1 cust', last_name: 'First cust')

        invoice_1 = Invoice.create!(status: 0, customer_id: customer_1.id)

        invoice_item_1 = InvoiceItem.create!(invoice_id: invoice_1.id, item_id: item_1.id, quantity: 1, unit_price: 100, status: 2)
        invoice_item_2 = InvoiceItem.create!(invoice_id: invoice_1.id, item_id: item_2.id, quantity: 1, unit_price: 200, status: 2)
        invoice_item_3 = InvoiceItem.create!(invoice_id: invoice_1.id, item_id: item_3.id, quantity: 1, unit_price: 300, status: 2)
        
        expect(invoice_1.revenue.to_f).to eq(600.0)
      end
    end
  end
end

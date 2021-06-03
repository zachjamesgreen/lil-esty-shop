require 'rails_helper'

describe 'Merchant Items Index' do
  before :each do
    @merchant = Merchant.create!(name: 'Sweaters n Things')
    @customer = Customer.create!(first_name: 'Bill', last_name: 'Haynes')
    @invoice_1 = @customer.invoices.create!(status: 2, customer_id: @customer.id)
    @invoice_2 = @customer.invoices.create!(status: 1, customer_id: @customer.id)
    @invoice_3 = @customer.invoices.create!(status: 0, customer_id: @customer.id)
    @item_1 = @merchant.items.create!(name: 'Alpaca Sweater', description: 'Warm and Fuzzy', unit_price: 0.75107e5, merchant_id: @merchant.id)
    @item_2 = @merchant.items.create!(name: 'Wool Sweater', description: 'Warm and Scratchy', unit_price: 0.5107e5, merchant_id: @merchant.id)
    @item_3 = @merchant.items.create!(name: 'Cotton Sweater', description: 'Cool and Fuzzy', unit_price: 0.17e5, merchant_id: @merchant.id)
    @item_4 = @merchant.items.create!(name: 'Denim Sweater', description: 'Cool and Scratchy', unit_price: 0.7510e5, merchant_id: @merchant.id)
    @item_5 = @merchant.items.create!(name: 'Leather Sweater', description: 'Warm and Sweaty', unit_price: 0.75e5, merchant_id: @merchant.id)
    @item_6 = @merchant.items.create!(name: 'Suede Sweater', description: 'Cool and Sweaty', unit_price: 0.7522e5, merchant_id: @merchant.id)
    @item_7 = @merchant.items.create!(name: 'Polyester Sweater', description: 'Cool and Noisy', unit_price: 0.1234e5, merchant_id: @merchant.id)
    @invoice_item_1 = InvoiceItem.create!(item_id:@item_1.id, invoice_id:@invoice_1.id, quantity: 24, unit_price: @item_1.unit_price, status: 2)
    @invoice_item_2 = InvoiceItem.create!(item_id:@item_2.id, invoice_id:@invoice_1.id, quantity: 1, unit_price: @item_1.unit_price, status: 2)
    @invoice_item_3 = InvoiceItem.create!(item_id:@item_3.id, invoice_id:@invoice_2.id, quantity: 2, unit_price: @item_1.unit_price, status: 2)
    @invoice_item_4 = InvoiceItem.create!(item_id:@item_4.id, invoice_id:@invoice_2.id, quantity: 3, unit_price: @item_1.unit_price, status: 0)
    @invoice_item_5 = InvoiceItem.create!(item_id:@item_5.id, invoice_id:@invoice_3.id, quantity: 4, unit_price: @item_1.unit_price, status: 1)
    @invoice_item_6 = InvoiceItem.create!(item_id:@item_6.id, invoice_id:@invoice_3.id, quantity: 5, unit_price: @item_1.unit_price, status: 2)
    @invoice_item_7 = InvoiceItem.create!(item_id:@item_7.id, invoice_id:@invoice_1.id, quantity: 6, unit_price: @item_1.unit_price, status: 0)
    @transaction_1 = @invoice_1.transactions.create!(invoice_id: @invoice_1.id, credit_card_number:'123445677890', credit_card_expiration_date: '02/07', result: 2) 
    @transaction_2 = @invoice_2.transactions.create!(invoice_id: @invoice_2.id, credit_card_number:'234456778901', credit_card_expiration_date: '02/08', result: 2)
    @transaction_3 = @invoice_3.transactions.create!(invoice_id: @invoice_3.id, credit_card_number:'012344567789', credit_card_expiration_date: '03/09', result: 2)
    visit "/merchants/#{@merchant.id}/items"
  end
  it 'has a header' do
    expect(page).to have_content("Sweaters n Things's Items")
  end

  it 'lists the five most popular items'

  it 'each item listed has a link to its show page'

  it 'displays total revenue generated for each item'
end
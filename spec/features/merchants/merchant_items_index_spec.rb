require 'rails_helper'

describe 'Merchant Items Index' do
  before :each do
    @merchant = Merchant.create!(name: 'Sweaters n Things')
    @customer = Customer.create!(first_name: 'Bill', last_name: 'Haynes')
    @invoice_1 = @customer.invoices.create!(status: 2, customer_id: @customer.id)
    @invoice_2 = @customer.invoices.create!(status: 1, customer_id: @customer.id)
    @invoice_3 = @customer.invoices.create!(status: 0, customer_id: @customer.id)
    @item_1 = @merchant.items.create!(name: 'Alpaca Sweater', description: 'Warm and Fuzzy', unit_price: 0.75107e5, status: 1, merchant_id: @merchant.id)
    @item_2 = @merchant.items.create!(name: 'Wool Sweater', description: 'Warm and Scratchy', unit_price: 0.5107e5, status: 1, merchant_id: @merchant.id)
    @item_3 = @merchant.items.create!(name: 'Cotton Sweater', description: 'Cool and Fuzzy', unit_price: 0.17e5, status: 1, merchant_id: @merchant.id)
    @item_4 = @merchant.items.create!(name: 'Denim Sweater', description: 'Cool and Scratchy', unit_price: 0.7510e5, status: 1, merchant_id: @merchant.id)
    @item_5 = @merchant.items.create!(name: 'Leather Sweater', description: 'Warm and Sweaty', unit_price: 0.75e5, status: 1, merchant_id: @merchant.id)
    @item_6 = @merchant.items.create!(name: 'Suede Sweater', description: 'Cool and Sweaty', unit_price: 0.7522e5, status: 1, merchant_id: @merchant.id)
    @item_7 = @merchant.items.create!(name: 'Polyester Sweater', description: 'Cool and Noisy', unit_price: 0.1234e5, status: 1, merchant_id: @merchant.id)
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

  it 'lists the five most popular items' do
    expect(page).to have_content("Sweaters n Things's 5 Top-Revenue Items")
    expect(page).to have_content("Alpaca Sweater")
    expect(page).to have_content("Polyester Sweater")
    expect(page).to have_content("Suede Sweater")
    expect(page).to have_content("Leather Sweater")
    expect(page).to have_content("Denim Sweater")
  end

  it 'each item listed has a link to its show page' do
    expect(page).to have_link("Alpaca Sweater")
    expect(page).to have_link("Polyester Sweater")
    expect(page).to have_link("Suede Sweater")
    expect(page).to have_link("Leather Sweater")
    expect(page).to have_link("Denim Sweater")
  end

  it 'clicking the link travels to an items show page' do
    within('div#top_items') do
      click_link('Alpaca Sweater')
    end
    expect(current_path).to eq "/merchants/#{@merchant.id}/items/#{@item_1.id}"
  end

  it 'displays total revenue generated for each item' do
    within('div#top_items') do
      expect(page).to have_content("Total Revenue Generated: $2,253.21")
    end
  end

  it 'contains a button to enable disabled items' do
    expect(page).to have_button('Disable')
    expect(page).not_to have_button('Enable')
  end

  it 'contains a button to disable enabled items' do
    item_8 = @merchant.items.create!(name: 'Fool Sweater', description: 'Ok', unit_price: 0.5107e5, status: 0, merchant_id: @merchant.id)
    visit "/merchants/#{@merchant.id}/items"
    expect(page).to have_button('Enable')
    expect(page).to have_button('Disable')
  end

  it 'clicking enable changes status' do 
    merchant_2 = Merchant.create!(name: 'Sweaters n Things')
    item = merchant_2.items.create!(name: 'Fool Sweater', description: 'Ok', unit_price: 0.5107e5, status: 1, merchant_id: @merchant.id)
    visit "/merchants/#{merchant_2.id}/items"

    expect(page).not_to have_button('Enable')
    click_button('Disable')
    expect(current_path).to eq "/merchants/#{merchant_2.id}/items"
    expect(page).to have_button('Enable')
  end

  it 'clicking disable changes status' do 
    merchant_2 = Merchant.create!(name: 'Sweaters n Things')
    item = merchant_2.items.create!(name: 'Fool Sweater', description: 'Ok', unit_price: 0.5107e5, status: 0, merchant_id: @merchant.id)
    visit "/merchants/#{merchant_2.id}/items"

    expect(page).not_to have_button('Disable')
    click_button('Enable')
    expect(current_path).to eq "/merchants/#{merchant_2.id}/items"
    expect(page).to have_button('Disable')
  end
end
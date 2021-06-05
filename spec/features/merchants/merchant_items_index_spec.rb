require 'rails_helper'

describe 'Merchant Items Index' do
  before :each do
    @merchant_1 = Merchant.find(1)
    @merchant_2 = Merchant.find(2)
    @merchant_3 = Merchant.find(3)
    @items_1 = @merchant_1.items
    @items_2 = @merchant_2.items
    @items_3 = @merchant_3.items
  end
  it 'has a header' do
    visit "/merchants/#{@merchant_1.id}/items"
    save_and_open_page
    expect(page).to have_content()
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

  it 'has a form to create a new item' do
    expect(page).to have_field('Name')
    expect(page).to have_field('Description')
    expect(page).to have_field('Unit price')
  end

  it 'creates a new item' do
    fill_in 'Name', with: 'New Product'
    fill_in 'Description', with: "It's a really great product."
    fill_in 'Unit price', with: 12345
    click_button('Create Item')

    expect(current_path).to eq "/merchants/#{@merchant.id}/items"
    expect(page).to have_link('New Product')
  end

  it 'does not create incomplete items' do
    fill_in 'Unit price', with: 12345
    click_button('Create Item')

    expect(current_path).to eq "/merchants/#{@merchant.id}/items"
    expect(page).to have_content('Item not created, missing/incorrect information')
  end

  it 'lists top items top day' do
    expect(page).to have_content("Top selling date for Alpaca Sweater was #{Date.today}")
  end

end
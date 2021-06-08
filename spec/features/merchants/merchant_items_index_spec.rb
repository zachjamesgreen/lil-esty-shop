require 'rails_helper'

describe 'Merchant Items Index' do
  before :each do
    @merchant_1 = Merchant.find(1)
    @merchant_2 = Merchant.find(2)
    @merchant_3 = Merchant.find(3)
    @items_1 = @merchant_1.items
    @items_2 = @merchant_2.items
    @items_3 = @merchant_3.items
    visit "/merchants/#{@merchant_1.id}/items"
  end
  it 'has a header' do
    expect(page).to have_content("Kirstin Feil's Items")
  end

  it 'lists the five most popular items' do
    expect(page).to have_content("Kirstin Feil's 5 Top-Revenue Items")
    within('div#top_items') do
      expect(page).to have_content('Aerodynamic Steel Plate')
      expect('Aerodynamic Steel Plate').to appear_before('Sleek Aluminum Chair')
    end
  end

  it 'each item listed has a link to its show page' do
    within('div#all_items') do
      expect(page).to have_link('Enormous Iron Shirt')
    end
  end

  it 'clicking the link travels to an items show page' do
    within('div#top_items') do
      click_link('Enormous Iron Shirt')
    end
    item_id = @items_1.first.id

    expect(current_path).to eq "/merchants/#{@merchant_1.id}/items/#{item_id}"
  end

  it 'has sections for enabled and disabled items' do
    expect(page).to have_content 'Enabled Items'
    expect(page).to have_content 'Disabled Items'
  end

  it 'contains a button to disable enabled items' do
    expect(page).to have_button('Disable')
    expect(page).not_to have_button('Enable')
  end

  it 'clicking disable changes status' do
    id = @items_1.first.id
    within("#disable-#{id}") do
      click_button('Disable')
    end

    expect(current_path).to eq "/merchants/#{@merchant_1.id}/items"
    expect(page).to have_button('Enable')
  end

  it 'clicking enable changes status' do 
    id = @items_1.first.id
    within("#disable-#{id}") do
      click_button('Disable')
    end

    expect(current_path).to eq "/merchants/#{@merchant_1.id}/items"
    expect(page).to have_button('Enable')

    within("#enable-#{id}") do
      click_button('Enable')
    end

    expect(current_path).to eq "/merchants/#{@merchant_1.id}/items"
    expect(page).not_to have_button('Enable')
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

    expect(current_path).to eq "/merchants/#{@merchant_1.id}/items"
    expect(page).to have_link('New Product')
  end

  it 'does not create incomplete items' do
    fill_in 'Unit price', with: 12345
    click_button('Create Item')

    expect(current_path).to eq "/merchants/#{@merchant_1.id}/items"
    expect(page).to have_content('Item not created, missing/incorrect information')
  end

  it 'lists top items top day' do
    expect(page).to have_content('Top selling date for Aerodynamic Steel Plate was: 2021-06-08')
  end

end
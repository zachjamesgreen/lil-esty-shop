require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe 'merchant items show page' do
  # As a merchant,
  # When I click on the name of an item from the merchant items index page,
  # Then I am taken to that merchant's item's show page (/merchant/merchant_id/items/item_id)
  # And I see all of the item's attributes including:

  # Name
  # Description
  # Current Selling Price
  it 'shows the merchants items atrributes' do
    merchant_1 = Merchant.create!(FactoryBot.attributes_for(:merchant))
    item_1 = merchant_1.items.create!(FactoryBot.attributes_for(:item))
    item_2 = merchant_1.items.create!(FactoryBot.attributes_for(:item))
    item_3 = merchant_1.items.create!(FactoryBot.attributes_for(:item))

    visit "merchants/#{merchant_1.id}/items"

    click_link "#{item_1.name}"
    
    expect(current_path).to eq("/merchants/#{merchant_1.id}/items/#{item_1.id}")
    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.description)
    expect(page).to have_content("Price: $#{(item_1.unit_price/100).round(2)}")
  end

  # As a merchant,
  # When I visit the merchant show page of an item
  # I see a link to update the item information.
  # When I click the link
  # Then I am taken to a page to edit this item
  # And I see a form filled in with the existing item attribute information
  # When I update the information in the form and I click ‘submit’
  # Then I am redirected back to the item show page where I see the updated information
  # And I see a flash message stating that the information has been successfully updated.
  it 'updates the items' do
    merchant_1 = Merchant.create!(FactoryBot.attributes_for(:merchant))
    item_1 = merchant_1.items.create!(FactoryBot.attributes_for(:item))

    visit "/merchants/#{merchant_1.id}/items/#{item_1.id}"

    click_link 'Update Item'

    fill_in 'Name',	with: 'Awesome Plundger'
    click_on 'Submit'

    expect(current_path).to eq("/merchants/#{merchant_1.id}/items/#{item_1.id}")
    expect(page).to have_content('The information has been successfully updated')
    expect(page).to have_content('Awesome Plundger')
  end
end





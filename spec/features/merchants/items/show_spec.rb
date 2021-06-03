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
    expect(page).to have_content(item_1.unit_price)
  end
end




require 'rails_helper'


describe 'merchant bulk discounts index' do
  before(:each) do
    @merchant = Merchant.find(1)
    @discount_1 = @merchant.bulk_discounts.create!(quantity_threshold: 10, discount_percent: 20)
    @discount_2 = @merchant.bulk_discounts.create!(quantity_threshold: 15, discount_percent: 25)
    @discount_3 = @merchant.bulk_discounts.create!(quantity_threshold: 20, discount_percent: 30)
    visit "/merchants/#{@merchant.id}/bulk_discounts"
  end

  it 'displays all bulk discounts' do
    expect(page).to have_content('Discount Quantity Threshold: 10')
    expect(page).to have_content('Discount Quantity Threshold: 15')
    expect(page).to have_content('Discount Quantity Threshold: 20')
    expect(page).to have_content('Discount Percentage: 20')
    expect(page).to have_content('Discount Percentage: 25')
    expect(page).to have_content('Discount Percentage: 30')
  end

  it 'displays the percentage discount' do

  end

  it 'displays the quantity threshold' do
    
  end

  it 'has a link to each discount show page' do
    
  end

  it 'clicking the link travels to show page' do
    
  end
end
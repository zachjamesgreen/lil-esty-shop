require 'rails_helper'

describe 'merchant discounts index' do
  before(:each) do
    @merchant = Merchant.find(1)
    @discount_1 = @merchant.bulk_discounts.create!(quantity_threshold: 10, discount_percent: 20)
    @discount_2 = @merchant.bulk_discounts
  end

  it 'displays all bulk discounts' do
    
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
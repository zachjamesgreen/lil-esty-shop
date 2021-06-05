require 'rails_helper'

RSpec.describe 'Admin Merchant Index' do
  it 'shows all merchants' do
    count = Merchant.all.size
    visit '/admin/merchants'
    expect(page.all('#merchants li').count).to eq count
  end

  it 'should have enable/disable button next to merchant name' do
    merchant = Merchant.all.order(:name).first
    visit '/admin/merchants'
    within "#merchants #merchant-#{merchant.id}" do
      expect(page).to have_selector(:link_or_button, 'Enabled')
      click_button('Enabled')
      expect(page).to have_selector(:link_or_button, 'Disabled')
    end
  end
end
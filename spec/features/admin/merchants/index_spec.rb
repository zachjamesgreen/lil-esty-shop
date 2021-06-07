require 'rails_helper'

RSpec.describe 'Admin Merchant Index' do
  it 'shows all merchants' do
    count = Merchant.all.size
    visit '/admin/merchants'
    expect(page.all('.merchants li').count).to eq count
  end

  it 'should have enable/disable button next to merchant name' do
    merchant = Merchant.all.order(:name).first
    visit '/admin/merchants'
    within ".merchants #merchant-#{merchant.id}" do
      expect(page).to have_selector(:link_or_button, 'Enabled')
      click_button('Enabled')
      expect(page).to have_selector(:link_or_button, 'Disabled')
    end
  end

  it 'shows merchants by status enabled/disabled' do
    # Merchant.first.update(enabled: false)
    enabled_count = Merchant.where(enabled: true).size
    disabled_count = Merchant.where(enabled: false).size
    visit '/admin/merchants'
    within '#enabled' do
      expect(page.find('h3')).to have_content('Enabled')
      expect(page.all('li').size).to eq enabled_count
    end
    within '#disabled' do
      expect(page.find('h3')).to have_content('Disabled')
      expect(page.all('li').size).to eq disabled_count
    end
  end
end
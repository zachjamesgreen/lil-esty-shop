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
    within "#merchant-#{merchant.id}" do
      expect(page).to have_selector(:link_or_button, 'Enable')
      click_button('Enable')
      expect(page).to have_selector(:link_or_button, 'Disable')
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

  it 'creates a new merchant' do
    visit '/admin/merchants'
    form = page.find('form')
    within form do
      fill_in 'name', with: 'New New Merchant'
      click_on 'commit'
    end
    expect(page).to have_content('New New Merchant')
  end
end
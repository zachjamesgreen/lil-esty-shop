# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin Merchant Index' do
  xit 'shows all merchants' do
    visit '/admin/merchants'
    count = Merchant.all.size
    e = page.all('.merchant').size
    visit '/admin/merchants'
    expect(e).to eq count
  end

  xit 'should have enable/disable button next to merchant name' do
    merchant = Merchant.all.order(:name).first
    visit '/admin/merchants'
    within "#merchant-#{merchant.id}" do
      expect(page).to have_selector(:link_or_button, 'Enable')
      click_button('Enable')
      expect(page).to have_selector(:link_or_button, 'Disable')
    end
  end

  xit 'shows merchants by status enabled/disabled' do
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

  xit 'creates a new merchant' do
    visit '/admin/merchants'
    form = page.find('form')
    within form do
      fill_in 'name', with: 'New New Merchant'
      click_on 'commit'
    end
    expect(page).to have_content('New New Merchant')
  end

  it 'shows top 5 merchants' do
    visit '/admin/merchants'
    raven = Merchant.find 5
    top_day = raven.top_day[0].created_at.strftime('%A, %B %d, %Y')
    galina = Merchant.find 1
    # evia = Merchant.find 13
    # cole = Merchant.find 35
    # berry = Merchant.find 12
    within '#top5' do
      expect(page).to have_content('Top 5 Merchants')
      within '#top5-list' do
        expect(page.all('.top5-list-item').size).to eq 5
        expect(raven.name).to appear_before galina.name
        within '#top5-list-5' do
          expect(page).to have_content '$2,811.38'
          expect(page).to have_content top_day
        end
      end
    end
  end
end

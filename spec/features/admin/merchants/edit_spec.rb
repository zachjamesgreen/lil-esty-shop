# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin Merchant Edit' do
  it 'has form to edit merchant' do
    merchant = Merchant.second
    visit "/admin/merchants/#{merchant.id}/edit"

    expect(page).to have_content("Edit #{merchant.name}")
    within 'form' do
      expect(page).to have_field('Name', with: merchant.name)
    end
  end

  it 'can update merchant through form' do
    merchant = Merchant.second
    visit "/admin/merchants/#{merchant.id}/edit"

    expect(page).to have_content("Edit #{merchant.name}")
    within 'form' do
      fill_in 'Name', with: 'Testing 123'
      click_on 'Update Merchant'
    end

    expect(page).to have_current_path("/admin/merchants/#{merchant.id}")
    expect(page).to have_content('Testing 123')
  end
end

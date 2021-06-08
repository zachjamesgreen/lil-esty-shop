require 'rails_helper'

RSpec.describe 'Admin Invoice Index' do
  it 'shows and invoice ids and links to show page' do
    visit '/admin/invoices'
    invoices = Invoice.all

    invoices.each do |i|
      expect(page).to have_link("Invoice #{i.id}", href: "/admin/invoices/#{i.id}")
    end
  end
end
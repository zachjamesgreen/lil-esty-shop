require 'rails_helper'

RSpec.describe 'Admin Invoice Show' do
  #   As an admin,
  # When I visit an admin invoice show page
  # Then I see information related to that invoice including:

  # Invoice id
  # Invoice status
  # Invoice created_at date in the format "Monday, July 18, 2019"
  # Customer first and last name
  it 'shows the attributes of and invoice' do
    invoice = Invoice.first
    customer = Customer.first

    visit "/admin/invoices/#{invoice.id}"

    expect(page).to have_content(invoice.id)
    expect(page).to have_content(invoice.status)
    expect(page).to have_content(invoice.created_at.strftime("%A, %B %d, %Y"))
    expect(page).to have_content(customer.first_name)
    expect(page).to have_content(customer.last_name)
  end

  it 'updates an invoice' do
    invoice = Invoice.first
    visit "/admin/invoices/#{invoice.id}"

    expect(page).to have_select('invoice_status', selected: invoice.status)
    select 'in progress', from: 'invoice_status'
    click_on 'commit'

    expect(page).to have_select('invoice_status', selected: 'in progress')
    select 'completed', from: 'invoice_status'
    click_on 'commit'

    expect(invoice.status).to eq 'completed'
  end
end
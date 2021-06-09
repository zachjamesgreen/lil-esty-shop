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

    # As an admin
  # When I visit an admin invoice show page
  # Then I see all of the items on the invoice including:

  # Item name
  # The quantity of the item ordered
  # The price the Item sold for
  # The Invoice Item status
  it 'shows the items attributes' do
    invoice = Invoice.first
    # customer = Customer.first
    # item = Item.find(3)
    # ii = InvoiceItem.find(1)

    visit "/admin/invoices/#{invoice.id}"
    
    expect(page).to have_content(invoice.items[0].name)
    expect(page).to have_content(invoice.items[1].name)
    expect(page).to have_content(invoice.items[2].name)
    expect(page).to have_content(invoice.items[3].name)
    expect(page).to have_content(invoice.invoice_items[0].quantity)
    expect(page).to have_content(invoice.invoice_items[1].quantity)
    expect(page).to have_content(invoice.invoice_items[2].quantity)
    expect(page).to have_content(invoice.invoice_items[3].quantity)
    expect(page).to have_content(invoice.invoice_items[0].unit_price)
    expect(page).to have_content(invoice.invoice_items[1].unit_price)
    expect(page).to have_content(invoice.invoice_items[2].unit_price)
    expect(page).to have_content(invoice.invoice_items[3].unit_price)
    expect(page).to have_content(invoice.invoice_items[0].status)
    expect(page).to have_content(invoice.invoice_items[1].status)
    expect(page).to have_content(invoice.invoice_items[2].status)
    expect(page).to have_content(invoice.invoice_items[3].status)
  end
end

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
    # As an admin
  # When I visit an admin invoice show page
  # Then I see all of the items on the invoice including:

  # Item name
  # The quantity of the item ordered
  # The price the Item sold for
  # The Invoice Item status
  it 'shows the items attributes' do
    invoice = Invoice.first
    customer = Customer.first
    item = Item.find(3)
    ii = InvoiceItem.find(1)

    visit "/admin/invoices/#{invoice.id}"
    save_and_open_page
    expect(page).to have_content(item.name)
    expect(page).to have_content(ii.quantity)
    expect(page).to have_content(ii.unit_price)
    expect(page).to have_content(ii.status)
  end
end

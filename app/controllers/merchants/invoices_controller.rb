class Merchants::InvoicesController < ApplicationController
  def index
    @invoices = Invoice.select('DISTINCT invoices.*').joins(invoice_items: :item).where('items.merchant_id = 10')
    @merchant = Merchant.find(params[:id])

  end
  def show
    if params[:invoice_id]
      @invoice = Invoice.find(params[:invoice_id])
      @customer = Customer.joins(:invoices).where('invoices.id = ?', params[:invoice_id]).first
      @items = Item.select('merchants.id, items.*, invoice_items.quantity, invoice_items.status')
      .joins(invoice_items: :invoice)
      .joins(:merchant)
      .where('merchants.id = 10')
    else
      @invoice = Invoice.find(params[:id])
    end
  end
end
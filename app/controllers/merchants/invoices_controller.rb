class Merchants::InvoicesController < ApplicationController
  def index
    @merchant = Merchant.find(params[:id])
    @invoices = Invoice.merchant_invoices(@merchant.id)
  end
  def show
    @invoice = Invoice.find(params[:invoice_id])
    @merchant = Merchant.find(params[:id])
    @customer = Customer.find(@invoice.customer_id)
    @items = Invoice.from_merch(params[:invoice_id])
  end
end
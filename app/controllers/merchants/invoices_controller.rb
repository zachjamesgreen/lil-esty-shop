class Merchants::InvoicesController < ApplicationController
  def index
    @merchant = Merchant.find(params[:id])
    @invoices = Invoice.merchant_invoices(@merchant.id)
  end
  def show
    @invoice = Invoice.find(params[:id])
    @customer = Customer.whos_invoice(params[:id])
    @items = Item.from_merch(params[:merch_id])
  end
end
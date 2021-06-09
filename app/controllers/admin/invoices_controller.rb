class Admin::InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find params[:id]
    @invoice_created_at = @invoice.created_at.strftime("%A, %B %d, %Y")
  end
end

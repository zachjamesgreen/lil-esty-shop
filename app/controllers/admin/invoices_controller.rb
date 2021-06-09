class Admin::InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find params[:id]
    @invoice_created_at = @invoice.created_at.strftime("%A, %B %d, %Y")
  end

  def update
    invoice = Invoice.find params[:id]
    invoice.update(status: params[:status])
    redirect_to admin_invoice_path(invoice.id)
  end
end

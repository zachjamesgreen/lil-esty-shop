class Admin::InvoicesController < ApplicationController
  def index

  end

  def show
    @invoice = Invoice.find params[:id]
    @invoice_created_at = @invoice.created_at.strftime("%A, %B %d, %Y")
    # require 'pry'; binding.pry
  end
end

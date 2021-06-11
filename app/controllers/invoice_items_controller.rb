# frozen_string_literal: true

class InvoiceItemsController < ApplicationController
  def update
    @invoice_item = InvoiceItem.find(params[:invoice_item_id])
    @invoice_item.update(inv_item_params)
    @merch_id = @invoice_item.item.merchant_id
    redirect_to "/merchants/#{@merch_id}/invoices/#{@invoice_item.invoice.id}"
  end

  private

  def inv_item_params
    params[:id] = params.delete :invoice_item_id
    params.permit(:status, :id)
  end
end

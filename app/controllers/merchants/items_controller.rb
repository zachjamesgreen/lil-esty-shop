class Merchants::ItemsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:id])
    @items = Item.where(merchant_id: @merchant.id)
    @top_items = @merchant.top_five
  end

  def show
    @item = Item.find(params[:item_id])
  end
end
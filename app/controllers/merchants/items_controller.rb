class Merchants::ItemsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:id])
    @items = Item.where("merchant_id = #{@merchant.id}")
  end

  def show
    @item = Item.find(params[:id])
  end
end
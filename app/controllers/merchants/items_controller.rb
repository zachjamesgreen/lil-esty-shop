class Merchants::ItemsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:id])
    @items = Item.where(merchant_id: @merchant.id)
    @top_items = @merchant.top_five
  end

  def show
    @merchant = Merchant.find(params[:id])
    @item = Item.find(params[:item_id])
  end

  def edit
    @merchant = Merchant.find(params[:id])
    @item = Item.find(params[:item_id])
  end

  def update
    @merchant = Merchant.find(params[:id])
    item = Item.find(params[:item_id])    
    if params[:enable]
      item.status = 1
      item.save
    end
    if params[:disable]
      item.status = 0
      item.save
    end 
    if item.update(item_params)
      redirect_to "/merchants/#{@merchant.id}/items/#{item.id}"
      flash[:alert] = "The information has been successfully updated"
    end      
  end

  private

  def item_params
    params.permit(:name, :description, :unit_price)
  end
end
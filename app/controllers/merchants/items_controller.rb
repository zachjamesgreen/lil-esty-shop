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

  def create
    @merchant = Merchant.find(params[:id])
    @item = Item.new(item_params)
    @item.status = 0
    @item.merchant_id = @merchant.id
    if @item.save
      redirect_to "/merchants/#{@merchant.id}/items"
      flash[:alert] = "Successfully created item!"
    else
      flash[:error] = "Item not created, missing/incorrect information"
      redirect_to "/merchants/#{@merchant.id}/items"
    end
  end

  def update
    @merchant = Merchant.find(params[:id])
    item = Item.find(params[:item_id])
    if params[:commit]
      if item.update(item_params)
          redirect_to "/merchants/#{@merchant.id}/items/#{item.id}"
          flash[:alert] = "The information has been successfully updated"
      end
    end
    if params[:enable]
      item.status = 1
      item.save
      redirect_to "/merchants/#{@merchant.id}/items"
    end
    if params[:disable]
      item.status = 0
      item.save
      redirect_to "/merchants/#{@merchant.id}/items"
    end
  end

  private

  def item_params
    params.permit(:name, :description, :unit_price)
  end
end
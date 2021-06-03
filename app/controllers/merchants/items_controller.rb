class Merchants::ItemsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:id])
    @top_items = @merchant.top_five
  end

  def show
    
  end
end
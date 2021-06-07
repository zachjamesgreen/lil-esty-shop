class Admin::MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all.order(:name)
    @enabled = @merchants.where(enabled: true)
    @disabled = @merchants.where(enabled: false)
  end

  def show
    @merchant = Merchant.find params[:id]
  end

  def edit
    @merchant = Merchant.find params[:id]
  end

  def update
    merchant = Merchant.find(params[:id])
    merchant.update(admin_merchant_params)
    if merchant
      flash[:notice] = 'Merchant Updated'
    else
      flash[:error] = 'Merchant Not Updated'
    end
    redirect_to admin_merchant_path(merchant)
  end

  def create
    @merchant = Merchant.new(admin_merchant_params)
    @merchant.save
    redirect_to admin_merchants_path
  end

  def enabled
    merchant = Merchant.find params[:id]
    merchant.update(enabled: params[:enabled])
    render json: {enabled: merchant.enabled}
  end

  private

  def admin_merchant_params
    params.require(:merchant).permit(:name)
  end
end
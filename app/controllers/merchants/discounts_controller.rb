module Merchants
  class DiscountsController < ApplicationController
    def index
      @merchant = Merchant.find(params[:id])
    end
  end
end
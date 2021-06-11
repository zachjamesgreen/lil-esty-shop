# frozen_string_literal: true

module Merchants
  class DashboardController < ApplicationController
    def index
      @merchant = Merchant.find(params[:id])
    end
  end
end

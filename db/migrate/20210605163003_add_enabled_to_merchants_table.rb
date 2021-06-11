# frozen_string_literal: true

class AddEnabledToMerchantsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :merchants, :enabled, :boolean, default: true
  end
end

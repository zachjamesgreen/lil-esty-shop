class RevertColumnChange < ActiveRecord::Migration[5.2]
  def change

    change_table :invoice_items do |t|
      t.remove :unit_price
      t.money :unit_price, default: 0
    end

    change_table :items do |t|
      t.remove :unit_price
      t.money :unit_price, default: 0
    end

  end
end

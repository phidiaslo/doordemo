class AddPriceDetailsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :total_price, :decimal
    add_column :orders, :total_order, :decimal
  end
end

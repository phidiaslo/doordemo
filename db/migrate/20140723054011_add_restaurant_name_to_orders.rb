class AddRestaurantNameToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :restaurant_name, :string
  end
end

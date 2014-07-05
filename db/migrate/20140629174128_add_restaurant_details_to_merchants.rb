class AddRestaurantDetailsToMerchants < ActiveRecord::Migration
  def change
    add_column :merchants, :restaurant_name, :string
    add_column :merchants, :restaurant_phone, :integer
    add_column :merchants, :address, :text
    add_column :merchants, :postcode, :integer
    add_column :merchants, :area, :string
    add_column :merchants, :city, :string
    add_column :merchants, :state, :string
    add_column :merchants, :restaurant_fax, :integer
    add_column :merchants, :website, :string
  end
end

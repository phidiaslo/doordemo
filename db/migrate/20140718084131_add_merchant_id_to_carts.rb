class AddMerchantIdToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :merchant_id, :integer
  end
end

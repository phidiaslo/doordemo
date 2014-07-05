class AddMerchantIdToListings < ActiveRecord::Migration
  def change
    add_column :listings, :merchant_id, :integer
  end
end

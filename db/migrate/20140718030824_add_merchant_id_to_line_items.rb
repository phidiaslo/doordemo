class AddMerchantIdToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :merchant_id, :integer
  end
end

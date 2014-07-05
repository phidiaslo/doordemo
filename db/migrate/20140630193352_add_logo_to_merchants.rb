class AddLogoToMerchants < ActiveRecord::Migration
 def self.up
    add_attachment :merchants, :logo
  end

  def self.down
    remove_attachment :merchants, :logo
  end
end

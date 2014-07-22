class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :delivery_date
      t.string :delivery_time	
      t.text :address
      t.string :pay_type

      t.timestamps
    end
  end
end

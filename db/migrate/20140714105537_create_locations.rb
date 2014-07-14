class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :location_name
      t.string :location_area
      t.text :location_address

      t.timestamps
    end
  end
end

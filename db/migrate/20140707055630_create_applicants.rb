class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.string :market

      t.timestamps
    end
  end
end

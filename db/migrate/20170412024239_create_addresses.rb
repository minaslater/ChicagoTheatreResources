class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street1, null: false
      t.string :street2
      t.string :city, null: false
      t.string :state, null: false
      t.integer :zip_code, null: false
      t.integer :location_id, index: true, null: false
      t.string :location_type, index: true, null: false

      t.timestamps
    end
  end
end

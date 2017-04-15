class CreateHours < ActiveRecord::Migration[5.0]
  def change
    create_table :hours do |t|
      t.integer :day_of_week, null: false
      t.integer :open
      t.integer :close
      t.boolean :closed, default: true, index: true
      t.integer :vendor_id, null: false, index: true

      t.timestamps
    end
  end
end

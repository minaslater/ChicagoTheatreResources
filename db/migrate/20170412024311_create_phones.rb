class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.string :number, null: false
      t.integer :owner_id, index: true, null: false
      t.string :owner_type, index: true, null: false

      t.timestamps
    end
  end
end

class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.integer :employer_id, index: true, null: false
      t.string :employer_type, index: true, null: false

      t.timestamps
    end
  end
end

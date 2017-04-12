class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.string :address, null: false
      t.integer :recipient_id, null: false, index: true
      t.string :recipient_type, null: false, index: true

      t.timestamps
    end
  end
end

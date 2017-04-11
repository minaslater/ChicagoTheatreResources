class CreateInterpreters < ActiveRecord::Migration[5.0]
  def change
    create_table :interpreters do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :accreditation, null: false
      t.boolean :rehearsal_avail, default: false
      t.boolean :performance_avail, default: false

      t.timestamps
    end
    add_index :first_name, :last_name, :rehearsal_avail, :performance_avail
  end
end

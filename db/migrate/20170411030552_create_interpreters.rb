class CreateInterpreters < ActiveRecord::Migration[5.0]
  def change
    create_table :interpreters do |t|
      t.string :first_name, null: false, index: true
      t.string :last_name, null: false, index: true
      t.string :accreditation, null: false
      t.boolean :rehearsal_avail, default: false, index: true
      t.boolean :performance_avail, default: false, index: true

      t.timestamps
    end
  end
end

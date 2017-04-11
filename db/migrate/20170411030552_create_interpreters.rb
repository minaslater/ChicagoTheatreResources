class CreateInterpreters < ActiveRecord::Migration[5.0]
  def change
    create_table :interpreters do |t|
      t.string :name, null: false
      t.string :accreditation, null: false
      t.boolean :rehearsal_avail, default: false
      t.boolean :performance_avail, default: false

      t.timestamps
    end
  end
end

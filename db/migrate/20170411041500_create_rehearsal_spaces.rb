class CreateRehearsalSpaces < ActiveRecord::Migration[5.0]
  def change
    create_table :rehearsal_spaces do |t|
      t.string :name, null: false
      t.integer :cost, index: true
      t.string :cost_unit, index: true
      t.text :notes

      t.timestamps
    end
  end
end

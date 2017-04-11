class CreateLightingVendors < ActiveRecord::Migration[5.0]
  def change
    create_table :lighting_vendors do |t|
      t.string :name, null: false
      t.boolean :deliver, default: false, index: true
      t.boolean :rental, default: false, index: true
      t.boolean :sales, default: false, index: true

      t.timestamps
    end
  end
end

class CreateWasteEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :waste_entries do |t|
      t.string :waste_type
      t.float :quantity
      t.string :unit
      t.date :entry_date
      t.text :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

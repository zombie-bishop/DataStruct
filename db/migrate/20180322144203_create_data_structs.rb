class CreateDataStructs < ActiveRecord::Migration[5.0]
  def change
    create_table :data_structs do |t|
      t.references :user, foreign_key: true
      t.integer :parent
      t.string :name, default: "Data Structure"

      t.timestamps
    end
  end
end

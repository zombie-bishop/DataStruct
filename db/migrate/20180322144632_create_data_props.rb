class CreateDataProps < ActiveRecord::Migration[5.0]
  def change
    create_table :data_props do |t|
      t.references :data_struct, foreign_key: true
      t.text :property

      t.timestamps
    end
  end
end

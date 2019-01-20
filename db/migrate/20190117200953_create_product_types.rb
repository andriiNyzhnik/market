class CreateProductTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :product_types do |t|
      t.string :name, null: false
      t.integer :parent_id

      t.timestamps
    end

    add_index :product_types, :parent_id
  end
end

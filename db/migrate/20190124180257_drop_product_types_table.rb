class DropProductTypesTable < ActiveRecord::Migration[5.2]
  def change
    remove_index :product_types, :parent_id

    remove_reference :products, :product_type

    drop_table :product_types
  end
end

class CreateCategoriesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.integer :parent_id

      t.timestamps
    end

    add_index :categories, :parent_id

    add_reference :products, :category, null: false, index: true
  end
end

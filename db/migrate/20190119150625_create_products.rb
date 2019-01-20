class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.decimal :price, null: false
      t.string :color, null: false, index: true
      t.text :description, null: false

      t.references :product_type, null: false

      t.timestamps
    end
  end
end

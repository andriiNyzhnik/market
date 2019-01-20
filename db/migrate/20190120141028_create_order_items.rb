class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :quantity, null: false, default: 1
      t.decimal :price, null: false, default: 0.0
      t.references :order, null: false
      t.references :product, null: false

      t.timestamps
    end
  end
end

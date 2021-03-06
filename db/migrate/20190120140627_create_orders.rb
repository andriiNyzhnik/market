class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :status, null: false
      t.text :details
      t.references :user, null: false

      t.timestamps
    end
  end
end

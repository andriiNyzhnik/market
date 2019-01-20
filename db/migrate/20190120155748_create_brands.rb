class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_reference :products, :brand, null: false
  end
end

class Product < ApplicationRecord
  belongs_to :product_type
  belongs_to :brand

  validates_presence_of :name, :price, :color, :description
end

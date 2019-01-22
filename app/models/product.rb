class Product < ApplicationRecord
  belongs_to :product_type
  belongs_to :brand

  validates_presence_of :name, :price, :color, :description

  scope :by_product_type, ->(product_type) { where(product_type: product_type) }
end

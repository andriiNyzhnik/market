class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  scope :by_product, ->(product) { where(product: product) }
  scope :by_product_type, ->(product_type) { joins(:product).merge(Product.by_product_type(product_type)) }
end

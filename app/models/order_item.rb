class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  scope :by_product, ->(product) { where(product: product) }
  scope :by_category, ->(category) { joins(:product).merge(Product.by_category(category)) }
end

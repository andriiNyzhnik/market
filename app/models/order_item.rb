class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  scope :by_product, ->(product) { where(product: product) }
  scope :by_category, ->(category) { joins(:product).includes(:product).merge(Product.by_category(category)) }
  scope :by_color, ->(color) { joins(:product).includes(:product).merge(Product.by_color(color)) }
end

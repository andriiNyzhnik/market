class Product < ApplicationRecord
  belongs_to :category
  belongs_to :brand

  validates_presence_of :name, :price, :color, :description

  scope :by_category, ->(category) { where(category: category) }
  scope :by_color, ->(color) { where(color: color) }
end

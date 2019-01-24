class Category < ApplicationRecord
  belongs_to :parent_category, optional: true

  has_many :child_categories, class_name: 'Category', foreign_key: :parent_id
  has_many :products

  validates_presence_of :name
end

class ProductType < ApplicationRecord
  belongs_to :parent_product_type, optional: true

  has_many :child_product_types, class_name: 'ProductType', foreign_key: :parent_id
end

class Order < ApplicationRecord
  enum status: { draft: 'new', completed: 'completed' }

  has_many :order_items

  belongs_to :user

  validates_presence_of :status
end

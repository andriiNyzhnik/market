class Order < ApplicationRecord
  has_many :order_items

  belongs_to :user

  validates_presence_of :status
end

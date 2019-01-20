class User < ApplicationRecord
  has_many :orders

  validates_presence_of :email, :first_name, :last_name, :phone
end

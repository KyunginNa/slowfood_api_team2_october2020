class Product < ApplicationRecord
  validates_presence_of :name, :price
  has_many :order_items
end

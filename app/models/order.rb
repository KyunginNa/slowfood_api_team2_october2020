class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  def calculate_amount
    order_items.joins(:product).sum('products.price') * 100
  end
end

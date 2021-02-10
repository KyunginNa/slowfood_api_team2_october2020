class ProductIndexSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description, :created, :order_items

  def created
    object.created_at.strftime('%F')
  end

  def price
    object.price.to_s.concat('USD')
  end

  def order_items
    object.order_items.count
  end
end

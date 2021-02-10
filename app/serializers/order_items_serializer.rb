class OrderItemsSerializer < ActiveModel::Serializer
  attributes :id, :product_name, :created

  def created
    object.created_at.strftime('%F')
  end

  def product_name
    object.product.name
  end

end

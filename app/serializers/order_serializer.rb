class OrderSerializer < ActiveModel::Serializer
  attributes :id, :products, :total

  def products
    object.order_items.group_by(&:product_id).map do |_key, value|
      product = value.uniq(&:product_id)[0].product
      { amount: value.size, id: product.id, name: product.name, total: (value.size * product.price) }
    end
  end

  def total
    object.calculate_amount
  end
end

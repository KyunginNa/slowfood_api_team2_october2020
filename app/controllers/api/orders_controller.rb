class Api::OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    product = Product.find(params[:product_id])
    order = current_user.orders.create
    order.order_items.create(product: product)
    if order.persisted?
      render json: {
        message: 'The product has been added to your order successfully.',
        items: order.order_items
      }, status: 201
    else
      render json: { message: 'Something went wrong.' }, status: 422
    end
  end

  def update
    order = Order.find(params[:id])
    product = Product.find(params[:product_id])
    new_item = order.order_items.create(product: product)
    if new_item.persisted?
      render json: {
        message: 'The product has been added to your order successfully.',
        items: order.order_items
      }, status: 201
    else
      render json: { message: 'Something went wrong.' }, status: 422
    end
  end
end

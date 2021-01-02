class Api::OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    product = Product.find(params[:product_id])
    order = current_user.orders.create
    order.order_items.create(product: product)
    if order.persisted?
      render json: create_json_response(order), status: 201
    else
      render json: { message: 'Something went wrong.' }, status: 422
    end
  end

  def update
    order = Order.find(params[:id])
    if params[:activity]
      order.update_attribute(:finalized, true)
      render json: { message: 'Thank you! Your order will be ready in 20 minutes.' }
    else
      product = Product.find(params[:product_id])
      new_item = order.order_items.create(product: product)
      if new_item.persisted?
        render json: create_json_response(order), status: 201
      else
        render json: { message: 'Something went wrong.' }, status: 422
      end
    end
  end

  private

  def create_json_response(order)
    json = { order: OrderSerializer.new(order) }
    json.merge!(message: 'The product has been added to your order successfully.')
  end
end

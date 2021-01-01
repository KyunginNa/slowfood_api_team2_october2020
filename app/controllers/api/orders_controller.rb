class Api::OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    product = Product.find(params[:product_id])
    order = current_user.orders.create
  end
end

class Api::ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products, each_serializer: ProductIndexSerializer
  end
end

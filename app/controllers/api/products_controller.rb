class Api::ProductsController < ApplicationController
  def index
    collection = Product.all
    render json: { products: collection }
  end
end

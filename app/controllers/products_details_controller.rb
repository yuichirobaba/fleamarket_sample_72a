class ProductsDetailsController < ApplicationController
  def show
    @product = Product.find(product_id: params[:product_id])
  end
end
class ItemsController < ApplicationController
  def index
    @product = Product.order('created_at DESC').first(4)
    @products = Product.select(:product, :category)
  end

  def show
  end
end


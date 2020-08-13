class ProductsController < ApplicationController

  before_action :authenticate_create_user!

  def index
    @product = Product.new
    @products = Product.includes(:images).order('created_at DESC')

  end
  
  def new
    @product = Product.new
    @product.images.build
    
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_details_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(
      :name, :comment, :price, :brand, :size, :shippingcharge, :status,
      :area, :days, :category_id, images_attributes: [:image]).merge(create_user_id: current_create_user.id)
    end
  end
  
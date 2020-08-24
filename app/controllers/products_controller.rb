class ProductsController < ApplicationController

  before_action :authenticate_create_user!

  def index
    @product = Product.new
    @products = Product.includes(:images).order('created_at DESC')

  end
  
  def new
    @product = Product.new
    @product.images.build
    
    @category_parent_arry = ["---"]
    @category_parent_arry = Category.where(ancestry: nil)
  end

  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render :index
    end
  end

  def show
    @product = Product.find(params[:id])
  end


  def destroy
    product = Product.find(params[:id])
    if product.create_user_id == current_create_user.id && product.destroy
      redirect_to root_path, notice: '削除されました'
    else
      render :show
    end
  end

  private

  def product_params
    params.require(:product).permit(
      :name, :comment, :price, :brand, :size, :shippingcharge, :status,
      :area, :days, :category_id, images_attributes: [:image]).merge(create_user_id: current_create_user.id)
    end
  end

  

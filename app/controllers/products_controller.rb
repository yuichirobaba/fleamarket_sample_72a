class ProductsController < ApplicationController

  before_action :authenticate_create_user!
  before_action :set_product, only: [:show, :edit, :update]

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
    @category_id = @product.category_id
    @category_parent = Category.find(@category_id).parent.parent
    @category_child = Category.find(@category_id).parent
    @category_grandchild = Category.find(@category_id)
  end


  def destroy
    product = Product.find(params[:id])
    if product.create_user_id == current_create_user.id && product.destroy
      redirect_to root_path, notice: '削除されました'
    else
      render :show
    end
  end

  def edit  #newとの違いはまず検索をかけなくてはいけない点にある。よってfind、find_by,whereなどの検索メソッドが必須  
    @category_parent_arry = ["---"]
    @category_parent_arry.unshift(["---"])
    @category_parent_arry = Category.where(ancestry: nil)
  end

  def update
    if @product.update(product_update_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end
  

  private

  def product_params
    params.require(:product).permit(
      :name, :comment, :price, :brand, :size, :shippingcharge, :status,
      :area, :days, :category_id, images_attributes: [:image]).merge(create_user_id: current_create_user.id)
  end

  def product_update_params
    params.require(:product).permit(
      :name, :comment, :price, :brand, :size, :shippingcharge, :status,
      :area, :days, :category_id, images_attributes: [:image, :_destroy, :id]).merge(create_user_id: current_create_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end

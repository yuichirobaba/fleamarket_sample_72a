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

  def edit  #newとの違いはまず検索をかけなくてはいけない点にある。よってfind、find_by,whereなどの検索メソッドが必須
    @product = Product.find(params[:id])
    
    @category_parent_arry = ["---"]
    @category_parent_arry = Category.where(ancestry: nil)

    # @category_child_array = @product.category.parent.parent.children
    # @category_grandchild_array = @product.category.parent.children


    # @product = Product.find(params[:id])
    # @user = CreateUser.find(@product.create_user_id)#最初にこの処理を持ってくる事で、商品を出品したユーザーのみが編集出来る
    # @images = Image.where(product_id: params[:id])
    # @images_first = Image.where(product_id: params[:id]).first #firstは配列の先頭の要素を持ってくる、恐らくトップページ等に映し出される商品の顔(仮)

    
  end

  def update
    @product = Product.find(params[:id])
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

end
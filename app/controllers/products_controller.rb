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
      # redirect_to product_path
    else
      render :new
    end
  end

  def edit  #newとの違いはまず検索をかけなくてはいけない点にある。よってfind、find_by,whereなどの検索メソッドが必須
    @product = Product.find(params[:id])
    @user = CreateUser.find(@product.create_user_id)#最初にこの処理を持ってくる事で、商品を出品したユーザーのみが編集出来る
    @images = Image.where(product_id: params[:id])
    @images_first = Image.where(product_id: params[:id]).first #firstは配列の先頭の要素を持ってくる、恐らくトップページ等に映し出される商品の顔(仮)

  end

  def update
    @product = Product.find(params[:id])
      
    if product_params[:images_attributes].nil?
      flash.now[:alert] = '更新できませんでした 【画像を１枚以上入れてください】' #最初に記述していればelsef処理を書かなくていい
      render :edit
    else
      exit_ids = []
      product_params[:images_attributes].each do |a,b|
        exit_ids << product_params[:images_attributes].dig(:"#{a}",:id).to_i #digメソッドによってproductが:images_attributesによってネストしている画像データ（to_iメソッドで数字が割り振られてる）が一部、空だったとしてもエラーが出ず処理される
      end
      ids = Image.where(product_id: params[:id]).map{|image| image.id } # mapメソッドで配列をそのあとの変数imageでid事に処理
      delete__db = ids - exit_ids#もとからあった画像データ - 更新された画像データ  (id付き)
      Image.where(id:delete__db).destroy_all #元あった画像データは削除
      @product.touch #touchメソッド、更新日時を現在時刻で更新
      if @product.update(product_params)

        redirect_to  products_details_path #詳細ページにいく様にしてみた
      else
        flash.now[:alert] = '更新できませんでした'
        render :edit
      end
    end
  end
  

  private

  def product_params
    params.require(:product).permit(
      :name, :comment, :price, :brand, :size, :shippingcharge, :status,
      :area, :days, :category_id, images_attributes: [:image]).merge(create_user_id: current_create_user.id)
  end
end

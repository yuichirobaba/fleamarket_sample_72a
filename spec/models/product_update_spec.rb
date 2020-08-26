require 'rails_helper'

describe Product do
  describe '#update' do

    it "商品名、価格、商品説明、配送料の負担、発送元の地域、発送までの日数、カテゴリーが入力されている場合編集可能" do
      product = update(:product)
      expect(product).to be_valid
    end

    it "nameがない場合は出品できないこと" do
      product = update(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end

    it "commentがない場合は出品できないこと" do
      product = update(:product, comment: "")
      product.valid?
      expect(product.errors[:comment]).to include("を入力してください")
    end

    it "commentが1001文字以上の場合、出品できないこと" do
      product = update(:product, comment: "a"*1001)
      product.valid?
      expect(product.errors[:comment]).to include("は1000文字以内で入力してください")
    end

    it "priceがない場合は出品できないこと" do
      product = update(:product, price: "")
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end

    it "priceが300円の場合は出品できる" do
      product = update(:product, price: "300")
      expect(product).to be_valid
    end

    it "priceが999,999円の場合は出品できる" do
      product = update(:product, price: "9999999")
      expect(product).to be_valid
    end

    it "priceが300円未満の場合は出品できない" do
      product = update(:product, price: "299")
      product.valid?
      expect(product.errors[:price]).to include("は300以上の値にしてください")
    end

    it "priceが9,999,999円より高い場合は出品できない" do
      product = update(:product, price: "10000000")
      product.valid?
      expect(product.errors[:price]).to include("は9999999以下の値にしてください")
    end

    it "priceが数字でない場合(文字列の場合)は、出品できない" do
      product = update(:product, price: "abcde")
      product.valid?
      expect(product.errors[:price]).to include("は数値で入力してください")
    end

    it "shippingchargeがない場合は出品できない" do
      product = update(:product, shippingcharge: nil)
      product.valid?
      expect(product.errors[:shippingcharge]).to include("を入力してください")
    end

    it "areaがない場合は出品できない" do
      product = update(:product, area: "")
      product.valid?
      expect(product.errors[:area]).to include("を入力してください")
    end

    it "daysがない場合は出品できない" do
      product = update(:product, days: "")
      product.valid?
      expect(product.errors[:days]).to include(("を入力してください"))
    end

    it "categoryがない場合は出品できない" do
      product = update(:product, category_id: "")
      product.valid?
      expect(product.errors[:category_id]).to include("を入力してください")
    end
  end
end
require 'rails_helper'

describe Product do
  describe '#create' do

    it "商品名、価格、商品説明、配送料の負担、発送元の地域、発送までの日数、カテゴリーが入力されている場合出品可能" do
      product = build(:product)
      expect(product).to be_valid
    end

    it "nameがない場合は出品できないこと" do
      product = build(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "commentがない場合は出品できないこと" do
      product = build(:product, comment: "")
      product.valid?
      expect(product.errors[:comment]).to include("can't be blank")
    end

    it "commentが1001文字以上の場合、出品できないこと" do
      product = build(:product, comment: "a"*1001)
      product.valid?
      expect(product.errors[:comment]).to include("is too long (maximum is 1000 characters)")
    end

    it "priceがない場合は出品できないこと" do
      product = build(:product, price: "")
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    it "priceが300円の場合は出品できる" do
      product = build(:product, price: "300")
      expect(product).to be_valid
    end

    it "priceが999,999円の場合は出品できる" do
      product = build(:product, price: "9999999")
      expect(product).to be_valid
    end

    it "priceが300円未満の場合は出品できない" do
      product = build(:product, price: "299")
      product.valid?
      expect(product.errors[:price]).to include("must be greater than or equal to 300")
    end

    it "priceが9,999,999円より高い場合は出品できない" do
      product = build(:product, price: "10000000")
      product.valid?
      expect(product.errors[:price]).to include("must be less than or equal to 9999999")
    end

    it "priceが数字でない場合(文字列の場合)は、出品できない" do
      product = build(:product, price: "abcde")
      product.valid?
      expect(product.errors[:price]).to include("is not a number")
    end

    it "shippingchargeがない場合は出品できない" do
      product = build(:product, shippingcharge: nil)
      product.valid?
      expect(product.errors[:shippingcharge]).to include("can't be blank")
    end

    it "areaがない場合は出品できない" do
      product = build(:product, area: "")
      product.valid?
      expect(product.errors[:area]).to include("can't be blank")
    end

    it "daysがない場合は出品できない" do
      product = build(:product, days: "")
      product.valid?
      expect(product.errors[:days]).to include(("can't be blank"))
    end

    it "categoryがない場合は出品できない" do
      product = build(:product, category_id: "")
      product.valid?
      expect(product.errors[:category_id]).to include("can't be blank")
    end
  end
end
require 'rails_helper'
describe DelivaryData do
  describe '#create' do
    
    it "zipcode,prefecture,city,address,building,phoneがあれば登録できる" do
      delivary_data = build(:delivary_data)
      expect(delivary_data).to be_valid
    end

    it "zipcodeがない場合は登録できない" do
      delivary_data = build(:delivary_data, zipcode: nil)
      delivary_data.valid?
      expect(delivary_data.errors[:zipcode]).to include("を入力してください")
    end

    it "prefectureがない場合は登録できない" do
      delivary_data = build(:delivary_data, prefecture: nil)
      delivary_data.valid?
      expect(delivary_data.errors[:prefecture]).to include("を入力してください")
    end

    it "cityがない場合は登録できない" do
      delivary_data = build(:delivary_data, city: nil)
      delivary_data.valid?
      expect(delivary_data.errors[:city]).to include("を入力してください")
    end

    it "addressがない場合は登録できない" do
      delivary_data = build(:delivary_data, address: nil)
      delivary_data.valid?
      expect(delivary_data.errors[:address]).to include("を入力してください")
    end

    it "buildingがない場合は登録できない" do
      delivary_data = build(:delivary_data, building: nil)
      delivary_data.valid?
      expect(delivary_data.errors[:building]).to include("を入力してください")
    end

    it "phoneがない場合は登録できない" do
      delivary_data = build(:delivary_data, phone: nil)
      delivary_data.valid?
      expect(delivary_data.errors[:phone]).to include("を入力してください")
    end

    it "zipcodeが全角英数の場合は登録できない" do
      delivary_data = build(:delivary_data, zipcode: "１２３４５６７")
      delivary_data.valid?
      expect(delivary_data.errors[:zipcode]).to include("is must NOT contain any other characters than alphanumerics.")
    end

    it "zipcodeでハイフンがある場合は登録できない" do
      delivary_data = build(:delivary_data, zipcode: "123-4567")
      delivary_data.valid?
      expect(delivary_data.errors[:zipcode]).to include("is must NOT contain any other characters than alphanumerics.")
    end
  end
end

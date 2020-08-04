require 'rails_helper'
describe CreateUser do
  describe '#create' do

    it "nickname,email,passwordとpassword_confirmation,familyname,firstname,family_name_kana,first_name_kana,birthdayがあれば登録できる事" do
      create_user = build(:create_user)
      expect(create_user).to be_valid
    end

    it "nicknameがない場合、登録できない事" do
      create_user = build(:create_user, nickname: nil)
      create_user.valid?
      expect(create_user.errors[:nickname]).to include("を入力してください")
    end

    it "emailがない場合は登録できない事" do
      create_user = build(:create_user, email: nil)
      create_user.valid?
      expect(create_user.errors[:email]).to include("を入力してください")
    end

    it "passwordがない場合は登録できない事" do
      create_user = build(:create_user, password: nil)
      create_user.valid?
      expect(create_user.errors[:password]).to include("を入力してください")
    end

    it "password存在してもpassword_confirmationがない場合は登録できな事" do
      create_user = build(:create_user, password_confirmation: "")
      create_user.valid?
      expect(create_user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "重複したemailが存在する場合は登録できない事" do
      create_user = create(:create_user)
      another_user = build(:create_user, email: create_user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "passwordが7文字以上の場合であれば登録できる事" do
      create_user = build(:create_user, password: "1234567", password_confirmation: "1234567")
      expect(create_user).to be_valid
    end
 
    it "passwordが5文字以下の場合登録できない事" do
      create_user = build(:create_user, password: "12345", password_confirmation: "12345")
      create_user.valid?
      expect(create_user.errors[:password]).to include("は6文字以上で入力してください", "は7文字以上で入力してください")
    end

    it "family_name_kanaがカナ入力出ない場合は登録できない事" do
      create_user = build(:create_user, family_name_kana: "kana")
      create_user.valid?
      expect(create_user.errors[:family_name_kana]).to include("is must NOT contain any other characters than alphanumerics.")
    end

    it "first_name_kanaがカナ入力出ない場合は登録できない事" do
      create_user = build(:create_user, first_name_kana: "kana")
      create_user.valid?
      expect(create_user.errors[:first_name_kana]).to include("is must NOT contain any other characters than alphanumerics.")
    end

    it "family_nameが空の場合登録できない事" do
      create_user = build(:create_user, family_name: nil)
      create_user.valid?
      expect(create_user.errors[:family_name]).to include("を入力してください")
    end

    it "first_nameが空の場合登録できない事" do
      create_user = build(:create_user, first_name: nil)
      create_user.valid?
      expect(create_user.errors[:first_name]).to include("を入力してください")
    end

    it "family_name_kanaが空の場合登録できない事" do
      create_user = build(:create_user, family_name_kana: nil)
      create_user.valid?
      expect(create_user.errors[:family_name_kana]).to include("を入力してください")
    end

    it "first_name_kanaが空の場合登録できない事" do
      create_user = build(:create_user, first_name_kana: nil)
      create_user.valid?
      expect(create_user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "birthday_year空の場合登録できない事" do
      create_user = build(:create_user, birthday_year: nil)
      create_user.valid?
      expect(create_user.errors[:birthday_year]).to include("を入力してください")
    end

    it "birthday_monthが空の場合登録できない事" do
      create_user = build(:create_user, birthday_month: nil)
      create_user.valid?
      expect(create_user.errors[:birthday_month]).to include("を入力してください")
    end

    it "birthday_dayが空の場合登録できない事" do
      create_user = build(:create_user, birthday_day: nil)
      create_user.valid?
      expect(create_user.errors[:birthday_day]).to include("を入力してください")
    end
  end
end
class CreateUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :family_name, :first_name, :birthday_year, :birthday_month, :birthday_day ,presence: true
  validates :password, presence: true, length: { minimum: 7 },
            format: { with: /\A[a-z0-9]+\z/i, message: "is must NOT contain any other characters than alphanumerics." }
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "is must NOT contain any other characters than alphanumerics." }
  validates :family_name_kana, :first_name_kana, presence: true,
            format: { with: /\A([ァ-ン]|ー)+\z/, message: "is must NOT contain any other characters than alphanumerics." }
  has_one :delivary_data
  has_many :products
  has_many :creditcards
  has_ancestry
end

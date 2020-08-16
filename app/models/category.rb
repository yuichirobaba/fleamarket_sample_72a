class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  has_ancestry

  validates :name, presence: true
end

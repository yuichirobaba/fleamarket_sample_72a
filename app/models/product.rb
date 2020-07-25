class Product < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :category, dependent: :destroy
  # has_many :comments, dependent: :destroy
  # has_many ;images, dependent: :destroy
end

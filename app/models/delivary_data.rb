class DelivaryData < ApplicationRecord
  belongs_to :create_user, optional: true

  validates :prefecture, :city, :address, :building, :phone ,presence: true
  validates :zipcode, presence: true,
            format: { with: /\A\d{7}\z/, message: "is must NOT contain any other characters than alphanumerics." }
end

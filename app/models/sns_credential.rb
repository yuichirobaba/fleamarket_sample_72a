class SnsCredential < ApplicationRecord
  belongs_to :create_user, optional: true
end

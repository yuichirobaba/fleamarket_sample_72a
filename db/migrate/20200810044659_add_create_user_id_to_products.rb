class AddCreateUserIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :create_user, foreign_key: true
  end
end

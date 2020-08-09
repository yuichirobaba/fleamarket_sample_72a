class RenameUserIdColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :user_id, :create_user_id
  end
end

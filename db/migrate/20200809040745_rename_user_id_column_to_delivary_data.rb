class RenameUserIdColumnToDelivaryData < ActiveRecord::Migration[5.2]
  def change
    rename_column :delivary_data, :user_id, :create_user_id
  end
end

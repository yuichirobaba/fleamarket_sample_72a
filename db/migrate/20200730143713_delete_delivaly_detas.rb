class DeleteDelivalyDetas < ActiveRecord::Migration[5.2]
  def change
    drop_table :delivary_data
  end
end

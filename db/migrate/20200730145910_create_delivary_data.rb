class CreateDelivaryData < ActiveRecord::Migration[5.2]
  def change
    create_table :delivary_data do |t|
      t.integer :zipcode, null: false
      t.string  :prefecture, null: false
      t.string  :city, null: false
      t.string  :address, null: false
      t.string  :building
      t.string  :phone
      t.references :create_user, foreign_key: true
      t.timestamps
    end
  end
end

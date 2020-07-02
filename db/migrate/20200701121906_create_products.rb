class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :comment, null: false
      t.integer :price, null: false
      t.string :brand
      t.string :size
      t.string :shippingcharge, null: false
      t.string :area, null: false
      t.string :days, null: false
      t.references :user, foreign_key: true
      # t.reference :category, foreign_key: true
      t.timestamps
    end
  end
end

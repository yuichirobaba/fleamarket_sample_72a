class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :image, null: false
      t.references :product, foreign_key: true #null: falseがいらないかもしれない
      t.timestamps
    end
  end
end



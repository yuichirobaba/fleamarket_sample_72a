class RemoveImageIdFromProduct < ActiveRecord::Migration[5.2]
  def change
    remove_reference :products, :image, foreign_key: true
  end
end

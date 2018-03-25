class AddPositionToWishItem < ActiveRecord::Migration[5.1]
  def change
    add_column :wish_items, :lat , :string
    add_column :wish_items, :lng , :string
  end
end

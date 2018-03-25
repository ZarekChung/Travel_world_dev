class EditWihsItemPlacIdType < ActiveRecord::Migration[5.1]
  def change
    change_column :wish_items, :place_id, :string
  end
end

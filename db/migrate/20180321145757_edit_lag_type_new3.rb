class EditLagTypeNew3 < ActiveRecord::Migration[5.1]
  def change
    change_column :wish_items, :lat, :float
    change_column :wish_items, :lng, :float
  end
end

class CreateWishItems < ActiveRecord::Migration[5.1]
  def change
    #drop_table :wish_items
    create_table :wish_items do |t|
      t.integer :place_id
      t.integer :wish_id
      t.string :spot_name
      t.string :image
      t.string :address
      t.string :district
      t.integer :rating
      t.timestamps
    end
  end
end

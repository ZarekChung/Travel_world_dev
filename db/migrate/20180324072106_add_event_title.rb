class AddEventTitle < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :title, :string
    change_column_null :events, :title, false
  end
end

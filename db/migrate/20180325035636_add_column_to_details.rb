class AddColumnToDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :details, :start_t, :datetime
  end
end

class EditDetailsStartTType < ActiveRecord::Migration[5.1]
  def change
     change_column :details, :start_t, :time
  end
end

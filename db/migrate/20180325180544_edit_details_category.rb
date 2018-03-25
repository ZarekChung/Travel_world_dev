class EditDetailsCategory < ActiveRecord::Migration[5.1]
  def change
     change_column :details, :category, :integer
     rename_column :details, :category, :category_id
  end
end

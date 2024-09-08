class AddCategoryToStudent < ActiveRecord::Migration[7.1]
  def change
    add_column :admins, :category, :string
  end
end

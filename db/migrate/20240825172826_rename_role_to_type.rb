class RenameRoleToType < ActiveRecord::Migration[7.1]
  def change
    rename_column :admins, :role, :type
  end
end

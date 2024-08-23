class CreateAdmins < ActiveRecord::Migration[7.1]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :email
      t.integer :age
      t.string :role

      t.timestamps
    end
  end
end

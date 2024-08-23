class DropTableEnrollments < ActiveRecord::Migration[7.1]
  def change
    drop_table :enrollments
  end
end

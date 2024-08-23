class CreateEnrollments < ActiveRecord::Migration[7.1]
  def change
    create_table :enrollments do |t|
      t.bigint :student_id
      t.bigint :course_id
      t.timestamps
    end
  end
end

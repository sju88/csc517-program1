class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.string :course_number
      t.string :student_email
      t.boolean :status

      t.timestamps null: false
    end
  end
end

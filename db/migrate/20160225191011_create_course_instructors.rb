class CreateCourseInstructors < ActiveRecord::Migration
  def change
    create_table :course_instructors do |t|
      t.string :course_number
      t.string :instructor_email

      t.timestamps null: false
    end
  end
end

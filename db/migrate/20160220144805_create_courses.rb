class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_number
      t.string :title
      t.text :description
      t.string :instructor
      t.datetime :start_date
      t.datetime :end_date
      t.string :status

      t.timestamps null: false
    end
  end
end

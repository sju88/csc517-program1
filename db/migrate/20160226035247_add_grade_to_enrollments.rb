class AddGradeToEnrollments < ActiveRecord::Migration
  def change
    add_column :enrollments, :grade, :integer
  end
end

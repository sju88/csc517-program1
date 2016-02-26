class CreateCourseMaterials < ActiveRecord::Migration
  def change
    create_table :course_materials do |t|
      t.string :course_number
      t.text :material

      t.timestamps null: false
    end
  end
end

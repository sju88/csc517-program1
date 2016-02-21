class CreateCtemps < ActiveRecord::Migration
  def change
    create_table :ctemps do |t|
      t.string :course_number
      t.string :string
      t.string :title
      t.string :string
      t.text :description
      t.string :instructor
      t.string :string
      t.string :start_date
      t.string :datetime
      t.string :end_date
      t.string :datetime
      t.string :status

      t.timestamps null: false
    end
  end
end

class Course < ActiveRecord::Base
    
    default_scope -> { order(course_number: :asc) }
    
    validates :course_number,  presence: true, uniqueness: { case_sensitive: false }
    validates :title,  presence: true
    validates :description,  presence: true
    validates :instructor,  presence: true
    validates :start_date,  presence: true
    validates :end_date,  presence: true
    
    has_many :enrollments
    has_many :students, through: :enrollments

end

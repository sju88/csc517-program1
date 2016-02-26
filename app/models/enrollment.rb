class Enrollment < ActiveRecord::Base
    
    belongs_to :student
    belongs_to :course
    
    validates :course_number, presence: true
    validates :student_email, presence: true
end

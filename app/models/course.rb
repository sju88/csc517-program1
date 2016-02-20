class Course < ActiveRecord::Base
    
    validates :course_number,  presence: true, uniqueness: { case_sensitive: false }
    validates :title,  presence: true
    validates :description,  presence: true
    validates :instructor,  presence: true
    validates :start_date,  presence: true
    validates :end_date,  presence: true

end

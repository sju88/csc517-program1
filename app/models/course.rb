class Course < ActiveRecord::Base
    
    default_scope -> { order(course_number: :asc) }
    
    validates :course_number,  presence: true, uniqueness: { case_sensitive: false }
    validates :title,  presence: true
    validates :description,  presence: true
    validates :start_date,  presence: true
    validates :end_date,  presence: true
    
    has_many :enrollments
    has_many :students, through: :enrollments
    has_many :course_instructors
    
  def self.search(search,searchby)
    if searchby =="Instructor"
      #searchby ="user_id"
      results = Array.new
      instructors = Instructor.where("name LIKE ?","%#{search}%")
      if instructors.count == 0
        return results
      else
        instructors.each do |instructor|

            courseinstructors = CourseInstructor.where(instructor_email: instructor.email)
            courseinstructors.each do |courseinstructor|
              course = Course.find_by(course_number: courseinstructor.course_number)
              if course && (!results.include? course)
                results << course
              end
            end
        end
      end
      return results
    end
    if searchby =="Course number"
      searchby = "course_number"
    end
    if searchby =="Status"
      where(status: search)
    else
      where("#{searchby} LIKE ?", "%#{search}%")
    end
  end

end

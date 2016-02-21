class EnrollmentController < ApplicationController
    

  def get_history(stumail)
    @enrollments = Enrollment.where(status: true, student_email: stumail)
  end
  
  def enroll
      @enrollment = Enrollment.new(student_enrollment_params)
  end

    
    private 
    def student_enrollment_params
     params.require(:enrollment).permit(:course_number, :student_email, :status => false)
    end

end

class InstructorsController < ApplicationController
  
  def index
    @instructors = Instructor.paginate(page: params[:page])
  end
  
  def show
    @instructor = Instructor.find(params[:id])
  end
  
  def new
    @instructor = Instructor.new
  end
  
  def create
    @instructor = Instructor.new(instructor_params)
    if @instructor.save
      flash[:success] = "Success!"
      redirect_to @instructor
    else
      render 'new'
    end
  end
  
  def edit
    @instructor = Instructor.find(params[:id])
  end
  
  def update
    @instructor = Instructor.find(params[:id])
    if @instructor.update_attributes(instructor_params)
      flash[:success] = "Profile updated"
      redirect_to @instructor
    else
      render 'edit'
    end
  end
  
  def destroy
    Instructor.find(params[:id]).destroy
    flash[:success] = "Instructor deleted"
    redirect_to instructors_url
  end
  
  def req
    @instructor = current_instructor
    @enrollments = Enrollment.where(status: false )
  end
  
  def studentsincourseinfo
    @course = Course.find_by(course_number: params[:course_number])
    @enrollments = Enrollment.where(course_number: params[:course_number], status: true)
  end
  
  def courseinfo
    @instructor = current_instructor
    @Course_Instructor_infos = CourseInstructor.where(instructor_email: @instructor.email)
  end
  
  def grade
    @enrollment = Enrollment.find(params[:enrollment_id])
    @student = Student.find_by(email: @enrollment.student_email)
  end
  
  def gradestudent
    @enrollment = Enrollment.find(params[:enroll_id])
    s_grade = params[:grade]
    @enrollment.update_attributes(grade: s_grade)
    redirect_to studentsincourse_info_path(course_number: @enrollment.course_number)
  end
  
  def removestudent
    @enrollment = Enrollment.find(params[:enrollment_id])
    Enrollment.find(params[:enrollment_id]).destroy
    flash[:success] = "Remove succeed!"
    redirect_to studentsincourse_info_path(course_number: @enrollment.course_number)
  end
  
  def approve
    @enrollments = Enrollment.find_by(id: params[:request_id])
    @enrollments.update_attributes(status: 1)
    flash[:success] = "Enrollment approved"
    redirect_to req_url
  end
  
  def disapprove
    Enrollment.find(params[:request_id]).destroy
    flash[:success] = "Enrollment disapproved!"
    redirect_to req_url
  end
  
  private

    def instructor_params
      params.require(:instructor).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
    
  # 确保是正确的用户
    def correct_instructor
      @instructor = Instructor.find(params[:id])
      redirect_to(root_url) unless current_instructor?(@instructor)
    end
end

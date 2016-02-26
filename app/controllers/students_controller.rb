class StudentsController < ApplicationController

  
  def index
    @students = Student.paginate(page: params[:page])
  end
  
  def show
    @student = Student.find(params[:id])
  end
  
  def new
    @student = Student.new
  end
  
  def create
    @student = Student.new(student_params)
    if @student.save
      student_log_in @student
      flash[:success] = "Welcome to the Class Portal!"
      redirect_to @student
    else
      render 'new'
    end
  end
  
  def edit
    @student = Student.find(params[:id])
  end
  
  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(student_params)
      flash[:success] = "Profile updated"
      redirect_to @student
    else
      render 'edit'
    end
  end
  
  def destroy
    Student.find(params[:id]).destroy
    flash[:success] = "Student deleted"
    redirect_to students_url
  end
  
  def history
    @student = current_student
    @enrollments = Enrollment.where(status: true, student_email: @student.email)
    @enrollments_pending = Enrollment.where(status: false, student_email: @student.email)
  end
  
  def search
    @courses = Course.all
  end
  
  def results
    @courses = Enrollment.where(course_number: @course.course_number)
  end
  
  def enroll
    @student = current_student
    course_number = params[:course_number]
    if Enrollment.find_by(course_number: course_number, student_email: @student.email)
      flash[:success] = "Has already enrolled"
    else
      Enrollment.create(course_number: course_number, student_email: @student.email, status: 0)
      flash[:success] = "Enroll succeed"
    end
    redirect_to search_url
  end
  
  def drop_course
    Enrollment.find(params[:enrollment_id]).destroy
    flash[:success] = "Drop succeed!"
    redirect_to history_url
  end
  
  def courseinfo
    @course = Course.find(params[:course_id])
  end

  private

    def student_params
      params.require(:student).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    def student_enrollment_params
     params.require(:enrollment).permit(:course_number, :student_email, :status => false)
    end
    
    
  # 确保是正确的用户
    def correct_student
      @student = Student.find(params[:id])
      redirect_to(root_url) unless current_student?(@student)
    end

end

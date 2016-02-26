class CoursesController < ApplicationController
  
  def new
      @course = Course.new
  end  

  def show
    @course = Course.find(params[:id])
  end
  
  def showcourse(cnum)
    @course = Course.find(cnum)
  end
  
  def create
    @course = Course.new(course_params)
    instructor_id = params[:instructor]
    @instructor = Instructor.find(instructor_id)
    @course.instructor = @instructor.email
    if @course.save
      CourseInstructor.create(course_number: @course.course_number, instructor_email: @instructor.email)
      redirect_to @course
    else
      render 'new'
    end
  end
  
  def edit
    @course = Course.find(params[:id])
  end
  
  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(course_params)
      flash[:success] = "Course updated"
      redirect_to @course
    else
      render 'edit'
    end
  end
  
  def search
    @courses = Course.paginate(page: params[:page])
  end
  
  def index
    @courses = Course.paginate(page: params[:page])
  end
  
  def destroy
    Course.find(params[:id]).destroy
    flash[:success] = "Course deleted"
    redirect_to courses_url
  end
  
  
  def add_student
    @student = Student.find_by(id: params[:student])
    @course = Course.find_by(id: params[:course_id])
    if Enrollment.find_by(student_email: @student.email, course_number: @course.course_number)
        flash[:success] = "This student is already in class!"
    else
        Enrollment.create(course_number: @course.course_number, student_email: @student.email, status: 1)
        flash[:success] = "Add succeed"
    end
    redirect_to @course
  end
  
  def drop_student
    @enrollment = Enrollment.find_by(id: params[:request_id])
    @course = Course.find_by(course_number: @enrollment.course_number)
    Enrollment.find_by(id: params[:request_id]).destroy
    flash[:success] = "Drop succeed"
    redirect_to @course
  end
  
  def add_instructor
    @instructor = Instructor.find_by(id: params[:instructor])
    @course = Course.find_by(id: params[:course_id])
    if CourseInstructor.find_by(instructor_email: @instructor.email, course_number: @course.course_number)
        flash[:success] = "This instructor is already in class!"
    else
        CourseInstructor.create(course_number: @course.course_number, instructor_email: @instructor.email)
        flash[:success] = "Add succeed"
    end
    redirect_to @course
  end
  
  def drop_instructor
    @courseinstructor = CourseInstructor.find_by(id: params[:request_id])
    @course = Course.find_by(course_number: @courseinstructor.course_number)
    temp = @courseinstructor.course_number
    if CourseInstructor.where(course_number: temp).count ==1
        flash[:success] = "There must be at least one instructor in a class!"
    else
        CourseInstructor.find_by(id: params[:request_id]).destroy
        flash[:success] = "Drop succeed"
    end
    redirect_to @course
  end
  
  def coursematerialinfo
    @course = Course.find_by(course_number: params[:course_number])
    @materials = CourseMaterial.where(course_number: params[:course_number] )
  end
  
  def addmaterial
    content = params[:material]
    course_num = params[:course_number]
    CourseMaterial.create(course_number: course_num, material: content)
    flash[:success] = "Add material succeed!"
    redirect_to coursematerial_info_path(course_number: course_num)
  end
  
    private

    def course_params
      params.require(:course).permit(:course_number, :title, :description, :instructor, :start_date, :end_date, :status)
    end
    
end

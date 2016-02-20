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
      log_in @student
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
  
  private

    def student_params
      params.require(:student).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
    
  # 确保是正确的用户
    def correct_student
      @student = Student.find(params[:id])
      redirect_to(root_url) unless current_student?(@student)
    end

end

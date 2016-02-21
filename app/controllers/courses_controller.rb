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
    if @course.save
      flash[:success] = "Success!"
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
  
    private

    def course_params
      params.require(:course).permit(:course_number, :title, :description, :instructor, :start_date, :end_date, :status)
    end
    
end

class CoursesController < ApplicationController
  
  def new
      @course = Course.new
  end  

  def show
    @course = Course.find(params[:id])
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
  
    private

    def course_params
      params.require(:course).permit(:course_number, :title, :description, :instructor, :start_date, :end_date, :status)
    end
    
end

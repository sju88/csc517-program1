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

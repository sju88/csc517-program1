class StaticPagesController < ApplicationController
  def home
    if logged_in?
      redirect_to current_admin
    elsif student_logged_in?
      redirect_to current_student
    elsif instructor_logged_in?
      redirect_to current_instructor
    end
  end

  def help
  end
  
  def about
  end
end

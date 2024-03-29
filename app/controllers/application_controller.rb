class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include StudentSessionsHelper
  include InstructorSessionsHelper
  
  def hello
    render text: "hello, world!"
  end
  
  def contact
  end
end

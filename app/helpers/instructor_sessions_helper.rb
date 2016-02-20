module InstructorSessionsHelper
    
    # 登入指定的用户
  def instructor_log_in(instructor)
    session[:instructor_id] = instructor.id
  end
  
  # 返回当前登录的用户（如果有的话）
  def current_instructor
    @current_instructor ||= Instructor.find_by(id: session[:instructor_id])
  end
  
  # 如果用户已登录，返回 true，否则返回 false
  def instructor_logged_in?
    !current_instructor.nil?
  end
  
# 退出当前用户
  def instructor_log_out
    forget(current_instructor)
    session.delete(:instructor_id)
    @current_instructor = nil
  end
  
  # 在持久会话中记住用户
  def remember(instructor)
    instructor.remember
    cookies.permanent.signed[:instructor_id] = instructor.id
    cookies.permanent[:remember_token] = instructor.remember_token
  end
  
  # 返回 cookie 中记忆令牌对应的用户
  def current_instructor
    if (instructor_id = session[:instructor_id])
      @current_instructor ||= Instructor.find_by(id: instructor_id)
    elsif (instructor_id = cookies.signed[:instructor_id])
      instructor = Instructor.find_by(id: instructor_id)
      if instructor && instructor.authenticated?(cookies[:remember_token])
        instructor_log_in instructor
        @current_instructor = instructor
      end
    end
  end

  
  # 忘记持久会话
  def forget(instructor)
    instructor.forget
    cookies.delete(:instructor_id)
    cookies.delete(:remember_token)
  end
  
  # 如果指定用户是当前用户，返回 true
  def current_instructor?(instructor)
    instructor == current_instructor
  end
  
  # 重定向到存储的地址，或者默认地址
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # 存储以后需要获取的地址
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end

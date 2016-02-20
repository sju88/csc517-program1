module StudentSessionsHelper
    
  # 登入指定的用户
  def student_log_in(student)
    session[:student_id] = student.id
  end
  
  # 返回当前登录的用户（如果有的话）
  def current_student
    @current_student ||= Student.find_by(id: session[:student_id])
  end
  
  # 如果用户已登录，返回 true，否则返回 false
  def student_logged_in?
    !current_student.nil?
  end
  
# 退出当前用户
  def student_log_out
    forget(current_student)
    session.delete(:student_id)
    @current_student = nil
  end
  
  # 在持久会话中记住用户
  def remember(student)
    student.remember
    cookies.permanent.signed[:student_id] = student.id
    cookies.permanent[:remember_token] = student.remember_token
  end
  
  # 返回 cookie 中记忆令牌对应的用户
  def current_student
    if (student_id = session[:student_id])
      @current_student ||= Student.find_by(id: student_id)
    elsif (student_id = cookies.signed[:student_id])
      student = Student.find_by(id: student_id)
      if student && student.authenticated?(cookies[:remember_token])
        student_log_in student
        @current_student = student
      end
    end
  end

  
  # 忘记持久会话
  def forget(student)
    student.forget
    cookies.delete(:student_id)
    cookies.delete(:remember_token)
  end
  
  # 如果指定用户是当前用户，返回 true
  def current_student?(student)
    student == current_student
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

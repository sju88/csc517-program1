module SessionsHelper
    # 登入指定的用户
  def log_in(admin)
    session[:admin_id] = admin.id
  end
  
  # 返回当前登录的用户（如果有的话）
  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id])
  end
  
  # 如果用户已登录，返回 true，否则返回 false
  def logged_in?
    !current_admin.nil?
  end
  
# 退出当前用户
  def log_out
    forget(current_admin)
    session.delete(:admin_id)
    @current_admin = nil
  end
  
  # 在持久会话中记住用户
  def remember(admin)
    admin.remember
    cookies.permanent.signed[:admin_id] = admin.id
    cookies.permanent[:remember_token] = admin.remember_token
  end
  
  # 返回 cookie 中记忆令牌对应的用户
  def current_admin
 if (admin_id = session[:admin_id])
      @current_admin ||= Admin.find_by(id: admin_id)
    elsif (admin_id = cookies.signed[:admin_id])
      admin = Admin.find_by(id: admin_id)
      if admin && admin.authenticated?(cookies[:remember_token])
        log_in admin
        @current_admin = admin
      end
    end
  end
  
  # 忘记持久会话
  def forget(admin)
    admin.forget
    cookies.delete(:admin_id)
    cookies.delete(:remember_token)
  end
  
end

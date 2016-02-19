class AdminsController < ApplicationController
  
  before_action :logged_in_admin, only: [:index, :edit, :update, :destroy]
  before_action :correct_admin,   only: [:edit, :update]
  
  def index
    @admins = Admin.paginate(page: params[:page])
  end
  
  def show
    @admin = Admin.find(params[:id])
  end
  
  def new
    @admin = Admin.new
  end
  
  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      log_in @admin
      flash[:success] = "Welcome to the Class Portal!"
      redirect_to @admin
    else
      render 'new'
    end
  end
  
  def edit
    @admin = Admin.find(params[:id])
  end
  
  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(admin_params)
      flash[:success] = "Profile updated"
      redirect_to @admin
    else
      render 'edit'
    end
  end
  
  def destroy
    Admin.find(params[:id]).destroy
    flash[:success] = "Admin deleted"
    redirect_to admins_url
  end
  
  private

    def admin_params
      params.require(:admin).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
  # 事前过滤器

    # 确保用户已登录
    def logged_in_admin
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
  # 确保是正确的用户
    def correct_admin
      @admin = Admin.find(params[:id])
      redirect_to(root_url) unless current_admin?(@admin)
    end
    
end

require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  def setup
    @admin = admins(:michael)
    @other_admin = admins(:archer)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @admin
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch :update, id: @admin, admin: { name: @admin.name, email: @admin.email }
    assert_redirected_to login_url
  end
  
  test "should redirect edit when logged in as wrong admin" do
    log_in_as(@other_admin)
    get :edit, id: @admin
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong admin" do
    log_in_as(@other_admin)
    patch :update, id: @admin, admin: { name: @admin.name, email: @admin.email }
    assert_redirected_to root_url
  end
  
  test "should redirect index when not logged in" do
    get :index
    assert_redirected_to login_url
  end

end

require 'test_helper'

class AdminsSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'Admin.count' do
      post admins_path, admin: { name:  "",
                               email: "user@invalid",
                               password:              "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'admins/new'
  end
  
  test "valid signup information" do
    get signup_path
    name     = "Example User"
    email    = "user@example.com"
    password = "password"
    assert_difference 'Admin.count', 1 do
      post_via_redirect admins_path, admin: { name:  name,
                                            email: email,
                                            password:              password,
                                            password_confirmation: password }
    end
    assert_template 'admins/show'
    assert is_logged_in?
  end

end

require 'test_helper'

class AdminsEditTest < ActionDispatch::IntegrationTest
  def setup
    @admin = admins(:michael)
  end

  test "unsuccessful edit" do
    log_in_as(@admin)
    get edit_admin_path(@admin)
    patch admin_path(@admin), admin: { name:  '',
                                    email: 'foo@invalid',
                                    password:              'foo',
                                    password_confirmation: 'bar' }
    assert_template 'admins/edit'
  end
  
test "successful edit with friendly forwarding" do
    get edit_admin_path(@admin)
    log_in_as(@admin)
    assert_redirected_to edit_admin_path(@admin)
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch admin_path(@admin), admin: { name:  name,
                                    email: email,
                                    password:              "",
                                    password_confirmation: "" }
    assert_not flash.empty?
    assert_redirected_to @admin
    @admin.reload
    assert_equal @admin.name,  name
    assert_equal @admin.email, email
  end
  
end

require 'test_helper'

class AdminsIndexTest < ActionDispatch::IntegrationTest
  def setup
    @admin = admins(:michael)
  end

  test "index including pagination" do
    log_in_as(@admin)
    get admins_path
    assert_template 'admins/index'
    assert_select 'div.pagination'
    Admin.paginate(page: 1).each do |admin|
      assert_select 'a[href=?]', admin_path(admin), text: admin.name
    end
  end
end

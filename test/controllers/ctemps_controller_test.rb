require 'test_helper'

class CtempsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

end

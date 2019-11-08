require 'test_helper'

class Admin::UserAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_user_admin_new_url
    assert_response :success
  end

end

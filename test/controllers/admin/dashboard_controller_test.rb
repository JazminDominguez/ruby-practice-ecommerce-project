require "test_helper"

class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get admin" do
    get admin_dashboard_admin_url
    assert_response :success
  end
end

require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get customer" do
    get dashboard_customer_url
    assert_response :success
  end
end

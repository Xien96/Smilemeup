require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_index_url
    assert_response :success
  end

  test "should get inbox" do
    get dashboard_inbox_url
    assert_response :success
  end

  test "should get orders" do
    get dashboard_orders_url
    assert_response :success
  end

  test "should get users" do
    get dashboard_users_url
    assert_response :success
  end

  test "should get settings" do
    get dashboard_settings_url
    assert_response :success
  end

end

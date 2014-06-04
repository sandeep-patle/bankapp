require 'test_helper'

class AdminDashboardControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get fund_transfer" do
    get :fund_transfer
    assert_response :success
  end

end

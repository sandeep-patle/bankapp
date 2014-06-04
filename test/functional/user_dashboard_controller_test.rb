require 'test_helper'

class UserDashboardControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get fund_transfer" do
    get :fund_transfer
    assert_response :success
  end

end

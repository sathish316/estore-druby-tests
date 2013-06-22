require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get login:post" do
    get :login:post
    assert_response :success
  end

  test "should get logout:post" do
    get :logout:post
    assert_response :success
  end

end

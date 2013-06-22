require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  test "should get index:get" do
    get :index:get
    assert_response :success
  end

  test "should get show:get" do
    get :show:get
    assert_response :success
  end

  test "should get add_to_cart:post" do
    get :add_to_cart:post
    assert_response :success
  end

end

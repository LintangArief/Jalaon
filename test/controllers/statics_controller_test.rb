require 'test_helper'

class StaticsControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

  test "should get rules" do
    get :rules
    assert_response :success
  end

  test "should get works" do
    get :works
    assert_response :success
  end

  test "should get contactme" do
    get :contactme
    assert_response :success
  end

  test "should get aboutme" do
    get :aboutme
    assert_response :success
  end

end

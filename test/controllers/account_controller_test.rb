require 'test_helper'

class AccountControllerTest < ActionController::TestCase
  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get verify" do
    get :verify
    assert_response :success
  end

  test "should get update_verify" do
    get :update_verify
    assert_response :success
  end

end

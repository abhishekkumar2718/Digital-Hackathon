require 'test_helper'

class User::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_user = user_users(:one)
  end

  test "should get index" do
    get user_users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_user_url
    assert_response :success
  end

  test "should create user_user" do
    assert_difference('User::User.count') do
      post user_users_url, params: { user_user: { password: 'secret', password_confirmation: 'secret', username: @user_user.username } }
    end

    assert_redirected_to user_user_url(User::User.last)
  end

  test "should show user_user" do
    get user_user_url(@user_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_user_url(@user_user)
    assert_response :success
  end

  test "should update user_user" do
    patch user_user_url(@user_user), params: { user_user: { password: 'secret', password_confirmation: 'secret', username: @user_user.username } }
    assert_redirected_to user_user_url(@user_user)
  end

  test "should destroy user_user" do
    assert_difference('User::User.count', -1) do
      delete user_user_url(@user_user)
    end

    assert_redirected_to user_users_url
  end
end

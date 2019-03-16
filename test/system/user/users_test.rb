require "application_system_test_case"

class User::UsersTest < ApplicationSystemTestCase
  setup do
    @user_user = user_users(:one)
  end

  test "visiting the index" do
    visit user_users_url
    assert_selector "h1", text: "User/Users"
  end

  test "creating a User" do
    visit user_users_url
    click_on "New User/User"

    fill_in "Password", with: 'secret'
    fill_in "Password confirmation", with: 'secret'
    fill_in "Username", with: @user_user.username
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit user_users_url
    click_on "Edit", match: :first

    fill_in "Password", with: 'secret'
    fill_in "Password confirmation", with: 'secret'
    fill_in "Username", with: @user_user.username
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit user_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end

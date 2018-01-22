require "application_system_test_case"

class SigninsTest < ApplicationSystemTestCase

  test "Index Page asks user to login" do
    visit root_url
    find_button('Log in').visible?
    find_link('Sign up').visible?
    assert_equal '/users/sign_in', page.current_path
    assert page.has_content?("Log in")

  end

  test "Sign up a new user then sign out and back in" do
    visit root_url
    click_link('Sign up')
    assert_equal '/users/sign_up', page.current_path
    assert page.has_content?("Sign up")
    fill_in 'Email', with:'3@email.com'
    fill_in 'Password', with:'password'
    fill_in 'Password confirmation', with:'password'
    click_button 'Sign up'
    assert page.has_content?("ORDER LIST")
    assert page.has_content? ("Welcome! You have signed up successfully.")
    assert_equal '/', page.current_path
    click_button 'LOG OUT'
    assert_equal '/users/sign_in', page.current_path
    fill_in 'Email', with:'3@email.com'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    assert_equal '/', page.current_path
  end






end

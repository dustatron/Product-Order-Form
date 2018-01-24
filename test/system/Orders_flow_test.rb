require "application_system_test_case"
require 'test_helper'

# def setup
#   @current_user = users(:admin)
# end

class SigninsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  test "Index page asks user to login or sign up" do
    visit root_url
    find_button('Log in').visible?
    find_link('Sign up').visible?
    assert_equal '/users/sign_in', page.current_path
    assert page.has_content?("Log in")
  end

  test "Can ad new user" do
    visit root_url
    assert_equal '/users/sign_in', page.current_path

    click_link('Sign up')
    assert_equal '/users/sign_up', page.current_path
    fill_in 'Email', with:'3@email.com'
    fill_in 'Password', with:'password'
    fill_in 'Password confirmation', with:'password'
    click_button 'Sign up'

    assert page.has_content?('ORDER LIST')
    assert_equal '/', page.current_path
  end

  test "User can log out" do
    sign_in users(:one)
    visit root_path

    click_button ('LOG OUT')
    assert_equal '/users/sign_in', page.current_path
  end


  test "Signed in user sees Order List"  do
    sign_in users(:one)
    visit root_path

    assert page.has_content?("ORDER LIST")
  end

  test "Can create Order" do
    sign_in users(:one)
    visit root_path
    assert_equal '/', page.current_path

    click_link 'New'
    assert_current_path edit_order_path(Order.last)
    assert page.has_content?("Order successfully created")
  end

  test "Add new item to order" do
    sign_in users(:one)
    visit root_path
    click_link('New')
    assert_current_path edit_order_path(Order.last)

    fill_in 'Number', with: '400'
    fill_in 'Size', with: '5'
    fill_in 'Gender', with: 'male'

    click_button 'Add'
    assert page.has_content?('400')
    assert page.has_content?('5')
    assert page.has_content?('male')
  end

  test "Edit Order" do
    sign_in users(:one)
    visit root_path

    assert  page.has_content?('Order #:1')
    first('.well').click_link('Edit')

    assert_current_path edit_order_path(1)
  end

  # test "Sign up a new user then sign out and back in" do
  #   visit root_url
  #   click_link('Sign up')
  #   assert_equal '/users/sign_up', page.current_path
  #   assert page.has_content?("Sign up")
  #   fill_in 'Email', with:'3@email.com'
  #   fill_in 'Password', with:'password'
  #   fill_in 'Password confirmation', with:'password'
  #   click_button 'Sign up'
  #   assert page.has_content?("ORDER LIST")
  #   assert page.has_content? ("Welcome! You have signed up successfully.")
  #   assert_equal '/', page.current_path
  #   click_button 'LOG OUT'
  #   assert_equal '/users/sign_in', page.current_path
  #   fill_in 'Email', with:'3@email.com'
  #   fill_in 'Password', with:'password'
  #   click_button 'Log in'
  #   assert_equal '/', page.current_path
  # end

end

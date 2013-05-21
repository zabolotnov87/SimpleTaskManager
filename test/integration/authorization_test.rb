require 'test_helper'

class AuthorizationTest < ActionDispatch::IntegrationTest

  fixtures :all

  test "login and browse site" do
    visit root_path
    current_path == new_session_path

    user = users(:Bob)

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'secret' 
    click_on 'Log In'
    current_path == root_path
  end
end

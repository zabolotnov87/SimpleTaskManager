require 'test_helper'

class AuthorizationTest < ActionDispatch::IntegrationTest

  fixtures :all

  test "login and browse site" do
    visit root_path
    current_path == login_path

    user = users(:bob)

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'secret' 
    click_on 'Log in'
    current_path == root_path
  end
end

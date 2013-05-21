require 'test_helper'

class Web::SessionsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
  end

  ## new
  test 'everybody can get new' do
    get :new
    assert_response :success
  end

  ## create
  test 'user login successfully' do
    post :create, signin: {email: @user.email, password: @user.password}
    assert_redirected_to root_url
    
    assert signed_in?
  end

  test 'user login failed' do
    post :create, signin: {email: @user.email, password: 'invalid_password'}
    assert_response :success
    assert_nil session[:user_id]
  end

  ## destroy
  test "user logout" do
    session[:user_id] = @user.id
    get :destroy
    assert_redirected_to root_url
    assert_nil session[:user_id]
  end
end

require 'test_helper'

class Web::SessionsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should login' do
    attrs = {email: @user.email, password: @user.password}
    post :create, signin: attrs
    assert_response :redirect
    assert signed_in?
  end

  test "should logout" do
    sign_in @user
    get :destroy
    assert_response :redirect
    assert !signed_in?
  end
end

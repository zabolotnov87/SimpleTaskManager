require 'test_helper'

class Web::TasksControllerTest < ActionController::TestCase
  setup do
    @task = tasks(:one)
    @user = users(:Bob)
  end

  ## index
  test 'guest can`t get index' do
    get :index
    assert_redirected_to new_session_url
  end

  test 'logged user can get index' do
    session[:user_id] = @user.id
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  ## show
  test 'guest can`t see the task' do
    get :show, id: @task
    assert_redirected_to new_session_url
  end

  test 'logged user can see the task' do
    session[:user_id] = @user.id
    get :show, id: @task
    assert_response :success
    assert_not_nil assigns(:task)
  end

  ## new
  test 'guest can`t get new' do
    get :new
    assert_redirected_to new_session_url
  end

  test 'logged user can get new' do
    session[:user_id] = @user.id
    get :new
    assert_response :success
    assert_not_nil assigns(:task)
  end


  ## edit
  test 'guest can`t get edit' do
    get :edit, id: @task
    assert_redirected_to new_session_url
  end

  test 'logged user can get edit' do
    session[:user_id] = @user.id
    get :edit, id: @task
    assert_response :success
    assert_not_nil assigns(:task)
  end

  ## create
  test 'guest can`t create a task' do
    post :create, task: { name: 'new simple task' }
    assert_redirected_to new_session_url
  end

  test 'logged user can create a task' do
    session[:user_id] = @user.id
    assert_difference('Task.count') do
      post :create, task: { name: 'new simple task' }
    end

    assert_redirected_to task_path(assigns(:task))
  end

  ## update
  test 'guest can`t update the task' do
    put :update, id: @task, task: {name: 'new name'}
    assert_redirected_to new_session_url
  end

  test "logged user can update the task" do
    session[:user_id] = @user.id
    put :update, id: @task, task: {name: 'new name'}
    assert_redirected_to task_path(assigns(:task))
  end

  ## destroy
  test 'guest can`t delete the task' do
    delete :destroy, id: @task
    assert_redirected_to new_session_url
  end

  test "logged user can delete the task" do
    session[:user_id] = @user.id
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task
    end

    assert_redirected_to tasks_path
  end

  ## state
  test 'guest can`t change state of a task' do
    put :state, id: @task, event: @task.state_events.first
    assert_redirected_to new_session_url
  end

  test 'logged user can change state of a task' do
    session[:user_id] = @user.id
    put :state, id: @task, event: @task.state_events.first
    assert_redirected_to task_path(assigns(:task))
  end
end

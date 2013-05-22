require 'test_helper'

class Web::TasksControllerTest < ActionController::TestCase
  setup do
    @task = create :task
    @user = create :user
    sign_in @user
  end

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get the task' do
    get :show, id: @task
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @task
    assert_response :success
    assert_not_nil assigns(:task)
  end

  test 'should create a task' do
    attrs = attributes_for :task, user_id: @user.id
    post :create, task: attrs
    assert_response :redirect
    task = Task.find_by_name attrs[:name]
    assert task
  end

  test "should update the task" do
    attrs = attributes_for :task
    put :update, id: @task.id, task: attrs
    assert_response :redirect
    task = Task.find_by_name attrs[:name]
    assert task
    assert_equal @task.id, task.id
  end

  test "should delete the task" do
    delete :destroy, id: @task.id
    assert_response :redirect
    assert !Task.exists?(@task)
  end

  test 'should change state of a task' do
    put :state, id: @task, event: @task.state_events.first
    assert_response :redirect
    task = Task.find @task
    assert_not_equal @task.state, task.state
  end
end

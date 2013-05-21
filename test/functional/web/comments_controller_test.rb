require 'test_helper'

class Web::CommentsControllerTest < ActionController::TestCase
  def setup
    @task = create :task
    @user = create :user
    @comment = create :comment
  end

  ## create
  test 'guest can`t comment the task' do
    post :create, comment: @comment.attributes
    assert_redirected_to new_session_url
  end

  test 'logged user can comment task' do
    session[:user_id] = @user.id
    request.env["HTTP_REFERER"] = task_url @task
    assert_difference('Comment.count') do
      post :create, comment: { body: 'new simple comment', user_id: @user.id, task_id: @task.id }
    end

    assert_redirected_to @task
  end

  ## destroy
  test 'guest can`t delete the comment' do
    delete :destroy, id: @comment
    assert_redirected_to new_session_url
  end

  test "logged user can delete the comment" do
    session[:user_id] = @user.id
    request.env["HTTP_REFERER"] = task_url @task
    assert_difference('Comment.count', -1) do
      delete :destroy, id: @comment
    end

    assert_redirected_to @task
  end
end

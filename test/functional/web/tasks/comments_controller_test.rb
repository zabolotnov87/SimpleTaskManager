require 'test_helper'

class Web::Tasks::CommentsControllerTest < ActionController::TestCase
  def setup
    @task = create :task
    @user = create :user
    sign_in @user
    @comment = create :comment
  end

  test 'should comment the task' do
    attrs = attributes_for :comment
    set_http_referer task_path(@task)
    post :create, task_id: @task.id, comment: attrs
    assert_response :redirect
    comment = Comment.find_by_body(attrs[:body])
    assert comment
  end
end

require 'test_helper'

class Web::CommentsControllerTest < ActionController::TestCase
  def setup
    @task = create :task
    @user = create :user
    sign_in @user
    @comment = create :comment
  end

  test 'should comment the task' do
    attrs = attributes_for :comment, task_id: @task.id
    set_http_referer task_path(@task)
    post :create, comment: attrs
    assert_response :redirect
    comment = Comment.find_by_body(attrs[:body])
    assert comment
  end

  test "should delete the comment" do
    set_http_referer task_path(@task)
    delete :destroy, id: @comment
    assert_response :redirect
    assert !Comment.exists?(@comments)
  end
end

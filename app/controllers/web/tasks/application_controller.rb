class Web::Tasks::ApplicationController < Web::ApplicationController

  before_filter :get_task

  def get_task
    @task = Task.find params[:task_id]
  end
end

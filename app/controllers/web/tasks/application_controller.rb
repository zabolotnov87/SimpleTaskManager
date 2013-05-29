class Web::Tasks::ApplicationController < Web::ApplicationController

  def current_task
    Task.find params[:task_id]
  end
end

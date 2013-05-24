class Web::TasksController < Web::ApplicationController
  
  def index
    @tasks = Task.by_owner(params[:owner_id]).by_state(params[:state]).recent_order
  end

  def show
    @task = Task.find(params[:id])
    @comments = @task.comments.includes(:user)
    @comment = Comment.new
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(params[:task])
    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @task = Task.find(params[:id])
      if @task.update_attributes(params[:task])
        redirect_to @task, notice: 'Task was successfully updated.'
      else
        render action: 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_url
  end

  def state
    event = params[:event]
    @task = Task.find params[:id]
    begin
      @task.fire_state_event event
      redirect_to @task
    rescue
      redirect_to @task, alert: 'Invalid state event.'
    end
  end
end

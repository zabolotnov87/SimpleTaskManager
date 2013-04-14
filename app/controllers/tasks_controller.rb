class TasksController < ApplicationController
  # GET /tasks
  def index
    @tasks = Task.by_owner(params[:owner_id]).by_state(params[:state]).recent_order
  end

  # GET /tasks/1
  def show
    @task = Task.find(params[:id])
    @comment = Comment.new
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  def create
    @task = Task.new(params[:task])
    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render action: 'new'
    end
  end

  # PUT /tasks/1
  def update
    @task = Task.find(params[:id])
      if @task.update_attributes(params[:task])
        redirect_to @task, notice: 'Task was successfully updated.'
      else
        render action: 'edit'
    end
  end

  # DELETE /tasks/1
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_url
  end

  # PUT /task/1/state
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

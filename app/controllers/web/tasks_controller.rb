class Web::TasksController < Web::ApplicationController

  def index
    @tasks = Task.by_owner(params[:owner_id])
                 .by_state(params[:state])
                 .recent_order
                 .includes(:user).decorate
  end

  def show
    @task = Task.find(params[:id]).decorate
    @comments = @task.comments.includes(:user)
    @comment = Comment.new
  end

  def new
    @task = Task.new.decorate
  end

  def edit
    @task = Task.find(params[:id]).decorate
  end

  def create
    @task = Task.new(params[:task])
    if @task.save
      flash_success
      redirect_to @task
    else
      flash_error
      render :new
    end
  end

  def update
    @task = Task.find(params[:id])
      if @task.update_attributes(params[:task])
        flash_success
        redirect_to @task
      else
        flash_error
        render :edit
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
      flash_success
      redirect_to @task
    rescue
      flash_error
      redirect_to @task
    end
  end
end

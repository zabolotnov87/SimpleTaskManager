class Web::Tasks::CommentsController < Web::Tasks::ApplicationController
  
  def create
    @comment = @task.comments.new(params[:comment])
    @comment.user = current_user
    if @comment.save
      flash_success
      redirect_to :back 
    else
      flash_error
      redirect_to :back
    end
  end
end

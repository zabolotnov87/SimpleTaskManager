class Web::Tasks::CommentsController < Web::Tasks::ApplicationController
  
  def create
    @comment = @task.comments.new(params[:comment])
    @comment.user = current_user
    if @comment.save
      redirect_to :back 
    else
      redirect_to :back, alert: @comment.errors.full_messages.uniq.first
    end
  end
end

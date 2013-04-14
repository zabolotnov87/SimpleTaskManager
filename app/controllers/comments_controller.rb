class CommentsController < ApplicationController
  # POST /comment
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      redirect_to :back
    else
      redirect_to :back, alert: @comment.errors.full_messages.uniq.first
    end
  end

  # DELETE /comment/1
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end
end

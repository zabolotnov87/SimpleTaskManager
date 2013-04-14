class CommentsController < ApplicationController
  # POST /comment
  def create
    @comment = Comment.new(params[:comment])
    # по идее, даже если ошибка произойдет, она не отобразится
    unless @comment.save
      flash[:error] = @comment.errors.full_messages.uniq.first
    end
    redirect_to :back
  end

  # DELETE /comment/1
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end
end

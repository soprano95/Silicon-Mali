class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog

  def create
    @comment = @blog.comments.create(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to blog_path(@blog), notice: 'Comment has been created'
    else
      redirect_to blog_path(@blog), alert: 'Comment has not been created'
    end
  end

  def destroy
    @comment = @blog.comments.find(params[:id])
    @comment.destroy
    redirect_to blog_path(@blog)
  end

  def update
    @comment = @blog.comments.find(params[:id])

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to blog_url(@blog), notice: 'Comment has been updated' }
      else
        format.html { redirect_to blog_url(@blog), alert: 'Comment was not updated!' }
      end
    end
  end

  private

  def set_blog
    @blog = Blog.find(params[:blog_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end

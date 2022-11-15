class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.post = Post.find(params[:post_id])
    @comment.author = current_user

    if @comment.save
      flash[:success] = 'Comment created successfully'
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      flash.now[:error] = 'Error: Comment could not be created'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

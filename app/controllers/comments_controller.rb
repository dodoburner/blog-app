class CommentsController < ApplicationController
  def create_comment
    @comment = Comment.new(comment_params)
    @comment.post = Post.find(params[:id])
    @comment.author = current_user

    if @comment.save
      flash[:success] = 'Comment created successfully'
      redirect_to post_path
    else
      flash.now[:error] = 'Error: Comment could not be created'
    end
  end

  def destroy_comment
    Comment.find(params[:comment]).destroy
    redirect_to post_path
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

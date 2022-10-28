class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.all.where(author_id: @user.id)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create_comment
    @comment = Comment.new(params.require(:form_comment).permit(:text))
    @comment.post = Post.find(params[:id])
    @comment.author = current_user

    if @comment.save
      flash[:success] = "Question saved successfully"
      redirect_to post_path
    else
      flash.now[:error] = "Error: Question could not be saved"
    end
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(params.require(:form_post).permit(:title, :text))
    @post.author = @user

    if @post.save
      flash[:success] = "Question saved successfully"
      redirect_to post_path(@user, @post)
    else
      flash.now[:error] = "Error: Question could not be saved"
    end
  end
end

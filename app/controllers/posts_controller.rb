class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.all.where(author_id: @user.id)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
    @like = Like.new
  end

  def new
    @post = Post.new
    @current_user = current_user
  end

  def create
    @user = current_user
    @post = Post.new(params.require(:form_post).permit(:title, :text))
    @post.author = @user

    if @post.save
      flash[:success] = 'Question saved successfully'
      redirect_to user_post_path(@user, @post)
    else
      flash.now[:error] = 'Error: Question could not be saved'
    end
  end
end

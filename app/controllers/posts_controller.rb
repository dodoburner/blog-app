class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(comments: [:author]).where(posts: { author_id: @user.id })
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.includes(comments: [:author]).where(posts: { id: params[:id] })[0]
    @comment = Comment.new
    @like = Like.new
  end

  def destroy
    Post.find(params[:id]).destroy
    @user = User.find(params[:user_id])
    redirect_to "/users/#{params[:user_id]}/posts"
  end

  def create_comment
    @comment = Comment.new(params.require(:form_comment).permit(:text))
    @comment.post = Post.find(params[:id])
    @comment.author = current_user

    if @comment.save
      flash[:success] = 'Comment created successfully'
      redirect_to post_path
    else
      flash.now[:error] = 'Error: Comment could not be created'
    end
  end

  def create_like
    @like = Like.new(author: current_user, post: Post.find(params[:id]))

    redirect_to post_path if @like.save
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(params.require(:form_post).permit(:title, :text))
    @post.author = @user

    if @post.save
      flash[:success] = 'Question saved successfully'
      redirect_to post_path(@user, @post)
    else
      flash.now[:error] = 'Error: Question could not be saved'
    end
  end
end

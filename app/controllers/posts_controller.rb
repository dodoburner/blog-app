class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
<<<<<<< HEAD
    @posts = Post.includes(comments: [:author]).where(posts: { author_id: @user.id })
=======
    @posts = Post.includes(comments: [:author]).where(posts: { author_id: params[:user_id] })
>>>>>>> 70ca49fcd027ac4c7ad9e44859a4720046f5a6cb
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.includes(comments: [:author]).where(posts: { id: params[:id] })[0]
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

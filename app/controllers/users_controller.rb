class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:user_id])
    @posts = Post.all.where(author_id: params[:user_id])
  end
end

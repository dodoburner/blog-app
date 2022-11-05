class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:user_id])
    @posts = @user.most_recent_posts
  end
end

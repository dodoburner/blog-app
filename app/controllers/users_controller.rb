class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @users = User.all
    @current_user = current_user
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.most_recent_posts
  end
end

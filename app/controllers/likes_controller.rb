class LikesController < ApplicationController
  def create
    @like = Like.new(author: current_user, post: Post.find(params[:post_id]))

    redirect_to user_post_path(params[:user_id], params[:post_id]) if @like.save
  end
end

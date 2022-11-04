class LikesController < ApplicationController
  def create_like
    @like = Like.new(author: current_user, post: Post.find(params[:id]))

    redirect_to post_path if @like.save
  end
end
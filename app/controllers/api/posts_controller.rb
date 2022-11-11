class Api::PostsController < Api::ApiController
  def index
    @posts = Post.all.where(author_id: params[:user_id])

    render json: @posts
  end
end

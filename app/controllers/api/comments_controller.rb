class Api::CommentsController < Api::ApiController
  def index
    @comments = Comment.all.where(post_id: params[:post_id])

    render json: @comments
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post = Post.find(params[:post_id])
    @comment.author = current_user

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
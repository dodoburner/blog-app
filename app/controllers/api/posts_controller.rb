class Api::PostsController < ApplicationController
  before_action :authenticate_request

  def index
    render :json => Post.all.where(author_id: params[:user_id])
  end
end

class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_likes_counter
    Post.find(post_id).update(likes_counter: Like.where(post_id: post.id).count)
  end
end

class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_comments_counter
    Post.find(post_id).update(comments_counter: Comment.where(post_id: post.id).count)
  end
end

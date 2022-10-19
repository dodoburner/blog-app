class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  # def initialize
  #   update_posts_counter
  # end

  def update_posts_counter
    User.find(author_id).update(posts_counter: Post.where(author_id: author.id).count)
  end

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end

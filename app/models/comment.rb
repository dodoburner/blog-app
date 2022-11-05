class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :increment_comments_counter
  after_destroy :decrement_comments_counter

  def as_json(_options = {})
    super(only: %i[text author_id])
  end

  private

  def increment_comments_counter
    post.increment!(:comments_counter)
  end

  def decrement_comments_counter
    post.decrement!(:comments_counter)
  end
end

class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments
  after_initialize :init
  after_save :increment_posts_counter
  after_destroy :decrement_posts_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def init
    self.likes_counter ||= 0
    self.comments_counter ||= 0
  end

  def increment_posts_counter
    author.increment!(:posts_counter)
  end

  def decrement_posts_counter
    author.decrement!(:posts_counter)
  end
end

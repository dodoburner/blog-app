class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
<<<<<<< HEAD
         :recoverable, :rememberable, :validatable
=======
         :recoverable, :rememberable, :validatable, :confirmable
>>>>>>> 70ca49fcd027ac4c7ad9e44859a4720046f5a6cb
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  after_initialize :init

  validates :name, presence: true
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }

  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  private

  def init
    self.posts_counter ||= 0
  end
end

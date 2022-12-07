class User < ApplicationRecord
  has_many :posts, foreign_key: :users_id
  has_many :comments, foreign_key: :users_id
  has_many :likes, foreign_key: :users_id

  validates :name, presence: true, uniqueness: true

  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end

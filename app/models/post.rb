class Post < ApplicationRecord
  belongs_to :author, class_name: :User, foreign_key: :users_id
  has_many :comments, foreign_key: :posts_id
  has_many :likes, foreign_key: :posts_id

  validates :title, presence: true, uniqueness: true, length: { maximum: 200 }

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  after_save :update_post_counter

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end

class Comment < ApplicationRecord
  belongs_to :posts, class_name: :Post, foreign_key: :users_id
  belongs_to :author, class_name: :User, foreign_key: :posts_id

  after_save :update_comment_counter

  private

  def update_comment_counter
    posts.increment!(:comments_counter)
  end
end

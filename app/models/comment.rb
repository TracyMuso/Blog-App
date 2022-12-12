class Comment < ApplicationRecord
  belongs_to :post, class_name: :Post, foreign_key: :post_id
  belongs_to :user, class_name: :User, foreign_key: :user_id

  after_save :update_comment_counter

  private

  def update_comment_counter
    post.increment!(:comments_counter)
  end
end

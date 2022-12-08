class Comment < ApplicationRecord
  belongs_to :post, class_name: :Post, foreign_key: :author_id
  belongs_to :author, class_name: :User, foreign_key: :post_id

  after_save :update_comment_counter

  private

  def update_comment_counter
    posts.increment!(:comments_counter)
  end
end

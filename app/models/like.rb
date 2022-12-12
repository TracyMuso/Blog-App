class Like < ApplicationRecord
  belongs_to :post, class_name: :Post, foreign_key: :post_id
  belongs_to :user, class_name: :User, foreign_key: :user_id

  after_save :update_like_counter

  private

  def update_like_counter
    post.increment!(:likes_counter)
  end
end

class Like < ApplicationRecord
  belongs_to :post, class_name: :Post, foreign_key: :users_id
  belongs_to :author, class_name: :User, foreign_key: :posts_id

  after_save :update_like_counter

  private

  def update_like_counter
    author.increment!(:likes_counter)
  end
end

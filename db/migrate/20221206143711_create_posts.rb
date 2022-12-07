class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :likes_counter
      t.integer :comments_counter

      t.timestamps
    end
    add_reference :posts, :users, index: true
  end
end

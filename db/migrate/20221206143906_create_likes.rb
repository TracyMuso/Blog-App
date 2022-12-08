class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|

      t.timestamps
    end
    remove_reference :likes, :users, index: true
    remove_reference :likes, :posts, index: true

    add_reference :likes, :author, index: true, foreign_key:{ to_table: :users}
    add_reference :likes, :post, index: true, foreign_key:{ to_table: :posts}
  end
end

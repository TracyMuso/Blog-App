class UpdateReferences < ActiveRecord::Migration[7.0]
  def change
    remove_reference :comments, :author, index: true, foreign_key:{ to_table: :users}
    remove_reference :comments, :post, index: true, foreign_key:{ to_table: :posts}
    add_reference :comments, :user, index: true, foreign_key:{ to_table: :users}
    add_reference :comments, :post, index: true, foreign_key:{ to_table: :posts}

    remove_reference :likes, :author, index: true, foreign_key:{ to_table: :users}
    remove_reference :likes, :post, index: true, foreign_key:{ to_table: :posts}
    add_reference :likes, :user, index: true, foreign_key:{ to_table: :users}
    add_reference :likes, :post, index: true, foreign_key:{ to_table: :posts}

    remove_reference :posts, :author, index: true, foreign_key:{ to_table: :users}
    add_reference :posts, :user, index: true, foreign_key:{ to_table: :users}

  end
end

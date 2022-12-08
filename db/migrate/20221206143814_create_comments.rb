class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :text

      t.timestamps
    end
    remove_reference :comments, :users, index: true
    remove_reference :comments, :posts, index: true

    add_reference :comments, :author, index: true, foreign_key:{ to_table: :users}
    add_reference :comments, :post, index: true, foreign_key:{ to_table: :posts}

  end
end

class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|

      t.timestamps
    end

    add_reference :likes, :author, index: true, foreign_key:{ to_table: :users}
    add_reference :likes, :post, index: true, foreign_key:{ to_table: :posts}
  end
end

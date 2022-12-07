class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|

      t.timestamps
    end
    add_reference :likes, :users, index: true
    add_reference :likes, :posts, index: true
  end
end

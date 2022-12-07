class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :text

      t.timestamps
    end
    add_reference :comments, :users, index: true
    add_reference :comments, :posts, index: true
  end
end

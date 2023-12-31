class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.string :title
      t.text :text
      t.integer :comments_counter
      t.integer :likes_counter

      t.timestamps
    end

    # add foreign key to, posts table, from users table, column name author_id
    add_foreign_key :posts, :users, column: :author_id

    # indexing foreign_key column "author_id"
    unless index_exists?(:posts, :author_id)
      add_index :posts, :author_id
    end
  end
end

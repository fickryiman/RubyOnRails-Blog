class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :post_id
      t.text :text

      t.timestamps
    end

    # add foreign key to, comments table, from users table, column name author_id
    add_foreign_key :comments, :users, column: :user_id

    # add foreign key to, comments table, from posts table, column name post_id
    add_foreign_key :comments, :posts, column: :post_id

    # indexing foreign_key column "author_id"
    unless index_exists?(:comments, :user_id)
      add_index :comments, :user_id
    end

    # indexing foreign_key column "author_id"
    unless index_exists?(:comments, :post_id)
      add_index :comments, :post_id
    end
  end
end

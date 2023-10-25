class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end

    # add foreign key to, likes table, from users table, column name author_id
    add_foreign_key :likes, :users, column: :user_id

    # add foreign key to, likes table, from posts table, column name post_id
    add_foreign_key :likes, :posts, column: :post_id

    # indexing foreign_key column "user_id"
    unless index_exists?(:likes, :user_id)
      add_index :likes, :user_id
    end

    # indexing foreign_key column "post_id"
    unless index_exists?(:likes, :post_id)
      add_index :likes, :post_id
    end
  end
end

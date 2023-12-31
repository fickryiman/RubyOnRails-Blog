class Post < ApplicationRecord
  belongs_to :author, foreign_key: 'author_id', class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  after_save :update_user_posts_counter

  private

  def update_user_posts_counter
    author.increment!(:posts_counter)
  end
end

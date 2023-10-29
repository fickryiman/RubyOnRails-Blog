require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @user = User.new(name: 'Fickry')
    @post = Post.new(author: @user, title: 'Test Post', text: 'Hi Tom!')
  end

  it 'post without comment should have 0 post.comments_counter' do
    expect(@post.comments_counter).to eq(nil)
  end

  it 'should increase or update_post_comments_counter' do
    Comment.create(user: @user, post: @post, text: 'Pertamax')
    Comment.create(user: @user, post: @post, text: 'Keduax')
    Comment.create(user: @user, post: @post, text: 'Ketigax')
    expect(@post.comments_counter).to equal(3)
  end
end

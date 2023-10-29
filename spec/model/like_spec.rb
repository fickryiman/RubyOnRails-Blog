require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @user = User.new(name: 'Fickry')
    @post = Post.new(author: @user, title: 'Test Post', text: 'Hi Tom!')
  end

  it 'post without like should have 0 post.likes_counter' do
    expect(@post.likes_counter).to eq(nil)
  end

  it 'should increase or update_post_likes_counter' do
    Like.create(user: @user, post: @post)
    Like.create(user: @user, post: @post)
    Like.create(user: @user, post: @post)
    expect(@post.likes_counter).to equal(3)
  end
end
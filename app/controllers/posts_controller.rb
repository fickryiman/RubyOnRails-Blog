class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(created_at: :desc)
  end
end

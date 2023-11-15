class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_recent_posts = @user.recent_posts
  end

  def index
    @users = User.order('users.id ASC').all
    @user = User.find(params[:id])
  end
end

class LikesController < ApplicationController

  before_action :authenticate_user!, only: [:new]

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @like = @post.likes.build
    @like.user = current_user

    if @like.save
      flash[:success] = 'Liked is added!'
    else
      flash[:error] = 'Likes could not be added!'
    end

    redirect_to user_post_path(@user, @post)
  end
end

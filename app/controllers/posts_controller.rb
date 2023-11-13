class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @user = current_user
    @post = Post.new
    respond_to do |format|
      format.html { render :new }
    end
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      flash[:success] = 'Post saved successfully'
      redirect_to user_posts_path(id: current_user.id)
    else
      flash.now[:error] = 'Error: Post could not be saved'
      render :new
    end
  end

  def index
    @user = User.find(params[:user_id])
    # @posts = @user.posts.order(created_at: :desc)
    @posts = @user.posts.includes(:comments)
    # @posts = Post.where(author_id: @user.id).includes(:comments, :user).order(created_at: :desc)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

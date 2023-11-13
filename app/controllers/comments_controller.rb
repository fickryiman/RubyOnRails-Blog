class CommentsController < ApplicationController

  before_action :authenticate_user!
  
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @user = current_user
    @text = params[:text]
    @comment = Comment.create(post: @post, user: @user, text: @text)

    if @comment.persisted?
      flash[:success] = 'Post comment has added successfully!'
      redirect_to user_post_path(@user, @post)
    else
      flash[:alert] = 'Something went wrong'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comments).permit(:text)
  end
end

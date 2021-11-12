#  Controller for posts
class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @users = User.all
    @user_posts = @user.posts.order(created_at: :desc)
    @comments = Comment.all
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = @post.comments.all.order(created_at: :desc)
    @users = User.all
    @likes = @post.likes.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.author = current_user
    if @post.save
      
      redirect_to user_posts_path, notice: 'Post added successfully!'
    else
      flash[:alert] = @post.errors.first.full_message
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

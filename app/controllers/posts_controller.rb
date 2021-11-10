#  Controller for posts
class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @users = User.all
    @user_posts = @user.recent_posts
    @comments = Comment.all
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = @post.comments.all
    @users = User.all
    @likes = @post.likes.all
  end
end

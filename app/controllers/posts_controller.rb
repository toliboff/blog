#  Controller for posts
class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = @user.recent_posts
    @comments = [];
    @user_posts.each do|post|
      @comments<<post.comments.all
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = @post.comments.all
    @likes = @post.likes.all
  end
end

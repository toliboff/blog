# Controller for users
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_posts = Post.where(author_id: @user.id)
    @comments = [];
    @user_posts.each do|post|
      @comments<<post.comments.all
    end
  end
end

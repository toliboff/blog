# Controller for users
class UsersController < ApplicationController
  def index
    @users = User.all.order('id')
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user.recent_posts
    @comments = Comment.all
  end
end

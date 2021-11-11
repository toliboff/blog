# Controller for users
class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.new(like_params)
    @like.author = current_user
    if @like.save
      redirect_to root_path
    else
      :new
    end
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end

# Controller for users
class Api::CommentsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @comments = Comment.where({post_id:params[:post_id]})
    render json: @comments
  end

end

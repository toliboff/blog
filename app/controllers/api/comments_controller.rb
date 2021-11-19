# Controller for users
class Api::CommentsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @comments = Comment.where({post_id:params[:post_id]})
    render json: @comments
  end

  def create
    @comment = Comment.new comment_params
    @comment.author = current_user
    @comment.post_id = params[:post_id]
    if @comment.save
      render json: {status: 'SUCCESS', message: 'Comment saved', data: @comment }, status: :ok
    else
      render json: {status: 'ERROR', message: 'Comment not saved', data: @comment.errors }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

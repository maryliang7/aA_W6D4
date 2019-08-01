class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.save!
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: Comment.all
  end

  def index
    if params[:user_id] || params[:artwork_id]
      comments = Comment.where(user_id: params[:user_id])

      comment_artwork = Comment.where(artwork_id: params[:artwork_id])
      render json: [comments, comment_artwork].flatten
    else
      render json: Comment.all
    end

  end

  private 
  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end
end
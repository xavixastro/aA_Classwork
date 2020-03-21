class CommentsController < ApplicationController

  def index

    if params[:user_id]
      render json: User.find(params[:user_id]).comments
    elsif params[:artwork_id]
      render json: Artwork.find(params[:artwork_id]).comments
    else
      render plain: "Invalid entry"
    end
  end

  def create 
    comment = Comment.create(comments_params)

    if comment.save 
      render json: comment 
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy 
    comment = Comment.find(params[:id]) 

    comment.destroy 
    render json: comment 
  end 

  private 
  def comments_params
    params.require(:comment).permit(:artwork_id, :user_id, :body)
  end

end

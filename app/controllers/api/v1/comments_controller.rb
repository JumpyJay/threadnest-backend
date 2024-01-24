class Api::V1::CommentsController < ApplicationController
  def index
    comment = Comment.all
    render json: comment, status: 200
  end

  def show
    comment = Comment.where(under: params[:under])
    if comment.any?
      render json: comment, status: 200
    else
      render json: {
        error: "Comment not found"
      }
    end
  end

  def create
    comment = Comment.new(
      body: crparams[:body],
      under: crparams[:under],
      author: crparams[:author]
    )
    if comment.save
      render json: comment, status: 200
    else
      render json: {
        error: "Error creating..."
      }
    end
  end

  def update
    comment = Comment.find_by(id: params[:id])
    if comment
      if comment.update(body: params[:body])
        render json: { message: "Comment record updated successfully" }
      else
        render json: { error: "Failed to update Comment record" }, status: :unprocessable_entity
      end
    else
      render json: { error: "Comment not found" }, status: :not_found
    end
  end
  

  def destroy
    comment = Comment.find_by(id: params[:id])
    if comment
      comment.destroy
      render json: "Comment has been deleted"
    else
      render json: {
        error: "Comment not found"
      }
    end
  end

  private
  def crparams
    params.require(:comment).permit([
      :body,
      :under,
      :author
    ])
  end
end

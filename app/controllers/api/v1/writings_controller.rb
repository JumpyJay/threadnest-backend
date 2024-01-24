class Api::V1::WritingsController < ApplicationController
  def index
    writings = Writing.all
    render json: writings, status: 200
  end

  def show
    title = params[:title].strip
    writing = Writing.where(title: title)
    if writing.any?
      render json: writing, status: 200
    else
      render json: {
        error: "Writing not found"
      }
    end
  end

  def create
    writing = Writing.new(
      title: wrparams[:title],
      body: wrparams[:body],
      author: wrparams[:author],
      under: wrparams[:under]
    )
    if writing.save
      render json: writing, status: 200
    else
      render json: {
        error: "Error creating..."
      }
    end
  end

  def update
    writing = Writing.find_by(id: params[:id])
    if writing
      if writing.update(title: params[:title], body: params[:body], author: params[:author], under: params[:under])
        render json: { message: "Writing record updated successfully" }
      else
        render json: { error: "Failed to update Writing record" }, status: :unprocessable_entity
      end
    else
      render json: { error: "Writing not found" }, status: :not_found
    end
  end

  def destroy
    writing = Writing.find_by(id: params[:title])
    if writing
      writing.destroy
      render json: "Writing has been deleted"
    else
      render json: {
        error: "Writing not found"
      }
    end
  end

  private
  def wrparams
    params.require(:writing).permit([
      :title,
      :body,
      :author,
      :under
    ])
  end
end


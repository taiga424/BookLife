class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_to book_path(params[:book_id])  }
      format.json
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    comment.destroy!
    redirect_to "/books/#{comment.book.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, book_id: params[:book_id])
  end
end
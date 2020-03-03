class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @books = Book.all.includes(:user).order("created_at DESC").page(params[:page]).per(12)
    @all_ranks = Book.find(Like.group(:book_id).order('count(book_id) desc').limit(5).pluck(:book_id))
  end

  def new
    @book = Book.new
  end
  
  def create
    Book.create(book_params)
    redirect_to books_path
  end

  def destroy
    book = Book.find(params[:id]) 
    book.destroy
    redirect_to books_path
  end

  def edit
  end

  def update
    book = Book.find(params[:id])
    book.update!(book_params)
    redirect_to books_path
  end

  def show
    if user_signed_in?
      @book = Book.find(params[:id])
      @like = Like.find_by(user_id: current_user.id, book_id: params[:id])
      @comment = Comment.new
      @comments = @book.comments.includes(:user)
    else
      @book = Book.find(params[:id])
      @comment = Comment.new
      @comments = @book.comments.includes(:user)
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :publisher, :image, :review, category_ids: []).merge(user_id: current_user.id)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end

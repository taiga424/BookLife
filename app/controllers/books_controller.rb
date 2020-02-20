class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @books = Book.all.order("created_at DESC").page(params[:page]).per(12)
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
    redirect_to "/users/#{current_user.id}"
  end

  def edit
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to "/users/#{current_user.id}"
  end

  def show
    @comment = Comment.new
    @comments = @book.comments.includes(:user)
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :publisher, :image, :review).merge(user_id: current_user.id)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end

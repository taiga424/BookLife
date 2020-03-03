class Books::SearchesController < ApplicationController
  def index
    @books = Book.search(params[:keyword]).order("created_at DESC").page(params[:page]).per(12)
  end
end

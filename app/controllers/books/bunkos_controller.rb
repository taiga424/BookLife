class Books::BunkosController < ApplicationController
  def index
    @category = Category.find(3)
    @books = @category.books
  end
end

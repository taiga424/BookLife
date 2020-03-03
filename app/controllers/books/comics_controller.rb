class Books::ComicsController < ApplicationController
  def index
    @category = Category.find(1)
    @books = @category.books
  end
end

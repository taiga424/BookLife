class Books::TankobonsController < ApplicationController
  def index
    @category = Category.find(2)
    @books = @category.books
  end
end

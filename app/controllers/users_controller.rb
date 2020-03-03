class UsersController < ApplicationController
  
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @books = user.books.page(params[:page]).per(12).order("created_at DESC")
  end
  
end

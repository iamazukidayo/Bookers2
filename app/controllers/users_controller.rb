class UsersController < ApplicationController

  def index
    @users = User.all
    @books = Book.all
    @book = Book.new
    @user = current_user
  end


  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
end

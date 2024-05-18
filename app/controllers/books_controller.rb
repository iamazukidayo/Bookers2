class BooksController < ApplicationController

  before_action :is_matching_login_user, only: [:edit, :update, :index]
   before_action :move_to_signed_in

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end



  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
  end

  def edit
    @user =  correct_user
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def update

    @book = Book.find(params[:id])
   if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
   else
    render :edit
   end
  end


  private
    def book_params
     params.require(:book).permit(:title, :body, :user_id)
    end

    def is_matching_login_user
    end

    def move_to_signed_in
       unless user_signed_in?
           redirect_to '/users/sign_in'
       end
    end

    def ensure_correct_user
       book = Book.find(params[:id])
      unless book.user_id == current_user.id
       redirect_to books_path
      end
    end

    def correct_user
      @book = Book.find(params[:id])
      @user = @book.user
      redirect_to(books_path) unless @user == current_user
    end
end





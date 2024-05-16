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



   def update
     @user = User.find(params[:id])
     if @user.update(user_params)
       flash[:notice] = "You have update user successfully."
       redirect_to user_path(current_user.id)
     else
      # flash[:notice] = "error prohibited this obj from being saved:"
       render :edit
     end
   end

   private

   def user_params
     params.require(:user).permit(:name, :profile_image, :introduction)
   end
end


class UsersController < ApplicationController
    before_action :is_matching_login_user, only: [:edit, :update, :index, :show, :edit,]
    before_action :move_to_signed_in
  
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
    if @user == current_user
        render :edit
    else
        redirect_to user_path(current_user.id)
    end
  end



   def update
     @user = User.find(params[:id])
     if @user.update(user_params)
       flash[:notice] = "You have update user successfully."
       redirect_to user_path(@user.id)
     else
      # flash[:notice] = "
       render :edit
     end
   end



   private

   def user_params
     params.require(:user).permit(:name, :profile_image, :introduction)
   end

   def is_matching_login_user
   end

   def move_to_signed_in
       unless user_signed_in?
           redirect_to '/users/sign_in'
       end
   end


end


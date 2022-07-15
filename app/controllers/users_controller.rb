class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  
  def index
    @user = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.id
    @books = Book.all
    @book = Book.new
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
       redirect_to books_path
    else
       render :edit
    end

  end

  private

  def user_params
    params. require(:user).permit(:name, :introduction,)
  end
  
  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
end

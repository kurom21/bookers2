class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.id
    @books = Book.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to books_path 
  end
end

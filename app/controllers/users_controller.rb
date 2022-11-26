class UsersController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully"
      redirect_to books_path
    else
      @books = Book.all
      render template: "books/index"
    end
  end

  def show
    @user = User.find_by(params[:id])
    @books = @user.books
  end

  def index
    @user = User.find_by(params[:id])
    @books = @user.books
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def edit
      user_id = params[:id].to_i
      login_user_id = current_user.id
      if(user_id != login_user_id)
        redirect_to book_path
      end
    @user = User.find_by(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "You have updates user successfully"
    redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
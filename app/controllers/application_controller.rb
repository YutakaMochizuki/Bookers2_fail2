class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    @user
  end

  def after_sign_out_path_for(resource)
    "/"
  end

  def new
    @book = Book.new(book_params)
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if  @book.save
      flash[:notice] = "You have created book successfully"
      redirect_to controller :'books', action: 'show'
    else
      @books = Book.all
      render template: "books/index"
    end
  end

  def edit
    @user = User.find_by(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end

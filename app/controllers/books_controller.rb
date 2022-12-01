class BooksController < ApplicationController

  before_action :correct_user, only: [:edit, :update]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully "
      redirect_to book_path(@book)
    else
      flash[:alert]

      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user == current_user
    redirect_to  edit_book_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if  @book.update(book_params)
       flash[:notice] = "You have update book successfully "
       redirect_to book_path
    else
        render :edit
    end
  end

  def destroy
    @books = Book.all
    @book = Book.find(params[:id])
    @book.destroy
    # unless @book.user == current_user
    redirect_to books_path
  end

  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
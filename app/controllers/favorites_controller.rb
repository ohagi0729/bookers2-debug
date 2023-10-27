class FavoritesController < ApplicationController
def create
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book: @book)
    favorite.save
    redirect_to redirect_path
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: @book.id)
    favorite.destroy
    redirect_to redirect_path
  end

  private

  def redirect_path
    if request.referer == book_url(@book)
      book_url(@book)
    else
      books_path
    end
  end
end
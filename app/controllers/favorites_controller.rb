class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book: @book)
    favorite.save
    #redirect_to request.referer
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: @book.id)
    favorite.destroy
    #redirect_to request.referer
  end

  private

  #def favorites_params
    #params.require(:favorites).permit(:user_id, :book_id)
  #end
end
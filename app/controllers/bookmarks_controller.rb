class BookmarksController < ApplicationController

  def new
    @bookmars = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params) # On crée un nouveau bookmark
    @bookmark.list = @list # On lui associe la liste

    if @bookmark.save!
      redirect_to list_path(@list) # Redirection vers la liste
    else
      render :new, status: :unprocessable_entity # Recharge la page avec erreurs
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

 private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end

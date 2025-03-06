class BookmarksController < ApplicationController

  def new
    @bookmars = Bookmark.new
  end

  def create
    # @list = List.find(params[:list_id]) # On récupère la liste associée
    @bookmark = Bookmark.new(bookmark_params) # On crée un nouveau bookmark
    @bookmark.list = @list # On lui associe la liste

    if @bookmark.save
      redirect_to list_path(@list), notice: 'Film ajouté avec succès !'  # Redirection vers la liste
    else
      @movies = Movie.all # IMPORTANT : Recharge les films pour la liste déroulante
      render :new, status: :unprocessable_entity # Recharge la page avec erreurs
    end
  end

  def destroy
    # @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: 'Film supprimé avec succès'
  end

 private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end

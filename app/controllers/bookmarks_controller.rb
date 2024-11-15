class BookmarksController < ApplicationController
  #GET new bookmark
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  #POST new bookmark
  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list), notice: "Bookmark was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  #destroy
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    @bookmark.destroy!
    redirect_to list_path(@list), notice: "Bookmark was successfully deleted.", status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end

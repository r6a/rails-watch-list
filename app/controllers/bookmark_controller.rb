class BookmarkController < ApplicationController
  #GET new bookmark
  def new
    @bookmark = Bookmark.new
  end

  #POST new bookmark
  def create
    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save
      redirect_to @bookmark, notice: "Bookmark was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def delete
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:name, :comment)
  end
end

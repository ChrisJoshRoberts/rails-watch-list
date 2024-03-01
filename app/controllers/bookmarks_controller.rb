class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    @movies = Movie.all
  end

  def create
    @movies = Movie.all
    @bookmark = Bookmark.new(bookmark_params)
    @list = @bookmark.list
    if @bookmark.save
      redirect_to list_bookmarks_path(@list), notice: "Bookmark created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id]) # Fetch the bookmark by its ID
    @list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

end

class BookmarksController < ApplicationController
  before_action :set_list_and_all_movies, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
    redirect_to list_path(@list) , notice: "Bookmark created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(@list.id)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_list_and_all_movies
    @list = List.find(params[:list_id])
    @movies = Movie.all
  end

end

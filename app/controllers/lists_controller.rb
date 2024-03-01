class ListsController < ApplicationController

  def index
    @lists = List.all
    @list = List.new
    @list.destroy

  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path, notice: "List was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.all
    @bookmark = Bookmark.new
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end

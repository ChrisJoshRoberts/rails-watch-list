class ListsController < ApplicationController

  def index
    @lists = List.all
    @list = List.new
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

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to list_path, status: :see_other
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end

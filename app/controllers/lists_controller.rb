class ListsController < ApplicationController
  before_action :set_list, only: %w(show destroy)

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

  def destroy
    raise
    @list.destroy
    redirect_to root_path
  end

  def show
    @movies = Movie.all
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end

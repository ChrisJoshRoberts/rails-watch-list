class ListsController < ApplicationController
  before_action :set_list, only: %w(show)

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

  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end

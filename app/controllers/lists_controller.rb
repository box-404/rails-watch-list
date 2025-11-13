class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @lists = List.new
  end

  def create
    @lists = List.new(list_params)
  end

  private
  # strong params
  def list_params
    params.require(:list).permit(:name)
  end
end

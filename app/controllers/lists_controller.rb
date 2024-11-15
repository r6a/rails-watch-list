class ListsController < ApplicationController
  #GET all lists
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  # GET /lists/1
  def show
    @bookmark = Bookmark.new
    @list = List.find(params[:id])
    @movies = @list.movies
  end

  # user create list
  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end

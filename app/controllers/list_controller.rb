class ListController < ApplicationController

  #GET all lists
  def index§
    @lists = List.all
  end

  # GET /lists/1
  def show
    @list = List.find(params[:id])
    @list = @list.movies
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

  private

  def list_params
    params.require(:list).permit(:name)
  end
end

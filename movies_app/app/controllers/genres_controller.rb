class GenresController < ApplicationController
  def index
  end

  def show
    @category = Category.find_by(id: params[:id])
    @movies =  @category.movies
  end
end

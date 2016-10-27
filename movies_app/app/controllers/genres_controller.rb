class GenresController < ApplicationController
  def index
  end

  def show
    @category = Category.find_by(id: params[:id])
    p @category
    @movies =  @category.movies
    p @movies
  end
end

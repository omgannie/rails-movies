class GenresController < ApplicationController
  def index
  end

  def show
    @category = Category.find_by(id: params[:id])
    @movies =  @category.movies

    respond_to do |format|
      format.js
    end
  end
end

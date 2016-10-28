class RatingsController < ApplicationController
  def index
    respond_to do |format|
      format.html { redirect_to root_path } #for my controller, i wanted it to be JS only
      format.js
    end
  end

  def new
    p params
    if params[:movie_id]
      @movie = Movie.find(params[:movie_id])
      p @movie
    else
      @review = Review.find(params[:review_id])
      p @review
    end
  end

  def create
    @rating.update_attributes(rating_params)
    redirect_to movie_path(@movie)
  end

  private
  def rating_params
    params.require(:rating).permit(:value)
  end
end

class RatingsController < ApplicationController
  def index
    respond_to do |format|
      format.html { redirect_to root_path } #for my controller, i wanted it to be JS only
      format.js
    end
  end

  def new
    if params[:movie_id]
      @movie = Movie.find(params[:movie_id])
    else
      @review = Review.find(params[:review_id])
    end
  end

  def create
    @movie = Movie.find(params[:movie_id].to_i)
    @rating = Rating.create(rateable: @movie, value: params[:rating][:value].to_i)

    redirect_to movie_path(@movie)
  end

  private
  def rating_params
    params.require(:rating).permit(:value)
  end
end

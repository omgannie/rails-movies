class RatingsController < ApplicationController
  def index
    respond_to do |format|
      format.html { redirect_to root_path } #for my controller, i wanted it to be JS only
      format.js
    end
  end

  def new
    if self.rateable_type == "Movie"
      @movie = Movie.find(params[:movie_id])
      @rating = Rating.create(rating_params)
      @rating.update_attributes(rateable_type: "Movie", rateable_id: @movie.id)
    else
      @review = Review.find(params[:review_id])
      @rating = Rating.create(rating_params)
      @rating.update_attributes(rateable_type: "Review", rateable_id: @review.id)
    end
  end

  def create

  end

  private
  def rating_params
    params.require(:rating).permit(:value)
  end
end

class ReviewsController < ApplicationController
  def new
    @movie = Movie.find(params[:id])
    @review = Review.new
    @user = User.find(params[:user_id])
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = Review.create(review_params)
    @review.reviewer_id = authorized_user.id
    @review.movie_id = @movie.id
    @review.save

    if @review.valid?
      redirect_to "/movies/#{@movie.id}"
    else
      @errors = @review.errors.full_messages
      p @errors
      render 'new'
    end
  end

  def show
    @review = Review.find(params[:review_id])
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :movie_id, :reviewer_id)
  end
end

class ReviewsController < ApplicationController
  def new
    @movie = Movie.find(params[:id])
    @review = Review.new
  end

  def create
    @movie = Movie.find(params[:id])
    @review = Review.create(review_params)
    @review.reviewer_id = @user.id
    @review.save

    if @review.valid?
      redirect_to '/movies/#{@movie.id}'
    else
      @errors = @review.errors.full_messages
      render 'new'
    end
  end

  def show
    #
  end
end

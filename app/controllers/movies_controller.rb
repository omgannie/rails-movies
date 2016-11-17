class MoviesController < ApplicationController
  def index
    @movies = Movie.recent
    @show_categories = true
  end

  def show
    @movie = Movie.find(params[:id])
    @reviews = @movie.reviews
  end

  def new
  end

  def create
  	if request.xhr?
  		movie = Movie.find_by(title: params['Title'])
  		p movie

  		if movie
  			movie_url = movie_path(movie)
  			render :json => {url: movie_url}
  		else
	  		@movie = Movie.new(title: params['Title'], cast: params['Actors'], poster_url: params["Poster"], release_date: params["Released"], synopsis: params["Plot"])

	  		if @movie.save
	  			new_movie_genres = params["Genre"].scan(/\w+/)
	  			@movie.associate_genres(new_movie_genres)

	  			movie_url = movie_path(@movie)
	  			render :json => {url: movie_url}
	  		else
	  			p @movie.errors.full_messages
	  		end
	  	end
  	end
  end
end

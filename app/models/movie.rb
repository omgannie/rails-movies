class Movie < ApplicationRecord
  scope :recent, -> { order("created_at DESC").limit(6) }

  has_many :reviews
  has_many :ratings, as: :rateable
  has_many :genres

  include Rateable

  validates :title, :release_date, :cast, presence: true

  def associate_genres(new_movie_genres)
  	new_movie_genres.each do |genre|
		if Category.get_genres.include? genre
			category = Category.find_by(genre: genre)
			self.genres.create(category: category)
		end
	end
  end
end

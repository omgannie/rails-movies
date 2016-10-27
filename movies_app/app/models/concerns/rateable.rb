module Rateable
  extend ActiveSupport::Concern

  included do
    has_many :ratings, as: :rateable
  end

  def average_rating
  	rating_values = []
  	self.ratings.each do |rating|
  		rating_values << rating.value
  	end
    return rating_values.reduce(:+)/self.ratings.length
  end
end

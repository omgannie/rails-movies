module Rateable
  extend ActiveSupport::Concern

  included do
    has_many :ratings, as: :rateable
  end

  def average_rating
    if self.ratings.length > 0
    	rating_values = []
    	self.ratings.each do |rating|
    		rating_values << rating.value
    	end
      return rating_values.reduce(:+)/self.ratings.length.to_f
    end
  end
end

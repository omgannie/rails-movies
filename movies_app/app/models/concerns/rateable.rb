module Rateable
  extend ActiveSupport::Concern

  included do
    has_many :ratings, as: :rateable
  end

  def average_rating
    return self.ratings.reduce(:+)/self.ratings.length
  end
end

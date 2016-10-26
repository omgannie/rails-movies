class Genre < ApplicationRecord
  belongs_to :movie
  belongs_to :category

  validates :category_id, :movie_id, presence: true
end

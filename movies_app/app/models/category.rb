class Category < ApplicationRecord
  has_many :genres
  has_many :movies, through: :genres, source: :movie

  validates :genre, uniqueness: true, presence: true
end

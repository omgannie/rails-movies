class Movie < ApplicationRecord
  scope :recent, -> { order("created_at DESC").limit(6) }

  has_many :reviews
  has_many :ratings, as: :rateable
  has_many :genres

  include Rateable

  validates :title, :release_date, :cast, :synopsis, presence: true
end

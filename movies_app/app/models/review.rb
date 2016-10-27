class Review < ApplicationRecord
  belongs_to :reviewer, class_name: "User"
  belongs_to :movie
  has_many :ratings, as: :rateable
  has_many :comments

  include Rateable

  validates :body, :title, presence: true
end

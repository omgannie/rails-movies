class Category < ApplicationRecord
  has_many :genres

  validates :genre, uniqueness: true, presence: true
end

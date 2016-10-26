class Category < ApplicationRecord
  belongs_to :genre

  validates :genre, uniqueness: true, presence: true
end

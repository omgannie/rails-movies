class Comment < ApplicationRecord
  belongs_to :review
  belongs_to :author, class_name: :User

  validates :body, :review_id, :author_id, presence: true
end

class User < ApplicationRecord
  has_secure_password

  has_many :reviews, foreign_key: :reviewer_id
  has_many :comments, foreign_key: :author_id

  validates :username, :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  attr_reader :key
  # logic for determining trusted_reviewer status
end

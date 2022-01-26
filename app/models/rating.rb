class Rating < ApplicationRecord
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  belongs_to :film
  belongs_to :user

  validates :user_id, :film_id, presence: true
end

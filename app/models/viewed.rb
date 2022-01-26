class Viewed < ApplicationRecord
  belongs_to :film
  belongs_to :user
  validates :user_id, :film_id, presence: true
end

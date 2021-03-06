class Watchlater < ApplicationRecord
  belongs_to :film
  belongs_to :user
  validates :user_id, :film_id, presence: true

  validates :user_id, uniqueness: { scope: :film_id }
end

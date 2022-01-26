class Comment < ApplicationRecord
  validates :text, length: { minimum: 3, maximum: 50 }
  belongs_to :film
  belongs_to :user
  validates :user_id, :film_id, presence: true
end

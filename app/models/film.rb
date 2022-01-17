class Film < ApplicationRecord
  validates :name, length: { maximum: 20 }, uniqueness: true
  validates :name, :genre, :director, :rating, :description, presence: true
  validates :genre, length: { minimum: 3 }
  validates :image_url, allow_blank: true, format: {
    with: /\.(gif|jpg|png)\z/i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
end

class User < ApplicationRecord
  include ImageUploader::Attachment(:image) # adds an `image` virtual attribute
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :phone, phone: true
  validates :name, length: { maximum: 20 }
  validates :name, :phone, presence: true
  validates :name, uniqueness: true

  has_many :comments
  has_many :watchlaters
  has_many :vieweds
end

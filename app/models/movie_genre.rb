class MovieGenre < ApplicationRecord
  has_many :directors
  validates :name, presence: true, uniqueness: true
end

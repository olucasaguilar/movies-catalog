class Director < ApplicationRecord
  belongs_to :favorite_genre, class_name: 'MovieGenre'
  has_many :movies
  
  validates :name, presence: true
  validates :nationality, presence: true
  validates :birthdate, presence: true
  validates :favorite_genre_id, presence: true
end

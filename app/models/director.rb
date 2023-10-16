class Director < ApplicationRecord
  belongs_to :favorite_genre, class_name: 'MovieGenre'

  validates :name, presence: true
  validates :nationality, presence: true
  validates :birthdate, presence: true
  validates :favorite_genre_id, presence: true
end

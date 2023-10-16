class Movie < ApplicationRecord
  enum status: { unreleased: 0, released: 1 }
  
  belongs_to :director
  belongs_to :movie_genre

  has_one_attached :image

  validates :title, presence: true
  validates :year, presence: true
  validates :synopsis, presence: true
  validates :country, presence: true
  validates :duration, presence: true
  validates :director_id, presence: true
  validates :movie_genre_id, presence: true
end

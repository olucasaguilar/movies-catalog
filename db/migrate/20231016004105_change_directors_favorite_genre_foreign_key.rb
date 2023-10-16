class ChangeDirectorsFavoriteGenreForeignKey < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :directors, column: :favorite_genre_id
    add_foreign_key :directors, :movie_genres, column: :favorite_genre_id
  end
end

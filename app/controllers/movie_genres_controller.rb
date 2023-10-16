class MovieGenresController < ApplicationController
  def index
    @movie_genres = MovieGenre.all
  end

  def new
    @movie_genre = MovieGenre.new
  end

  def create
    @movie_genre = MovieGenre.new(name: params[:movie_genre][:name])

    if @movie_genre.save
      flash[:notice] = 'Gênero criado com sucesso'
      return redirect_to(movie_genres_path)
    end

    render :new
  end

  def edit
    @movie_genre = MovieGenre.find(params[:id])
  end

  def update
    @movie_genre = MovieGenre.find(params[:id])

    if @movie_genre.update(name: params[:movie_genre][:name])
      flash[:notice] = 'Gênero atualizado com sucesso'
      return redirect_to(movie_genres_path)
    end

    render :edit
  end
end

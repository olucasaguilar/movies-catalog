class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
    @directors = Director.all
    @movie_genres = MovieGenre.all
  end

  def create
    @movie = Movie.new(title: params[:movie][:title],
                        year: params[:movie][:year],
                        synopsis: params[:movie][:synopsis],
                        country: params[:movie][:country],
                        duration: params[:movie][:duration],
                        director_id: params[:movie][:director_id],
                        movie_genre_id: params[:movie][:movie_genre_id],
                        status: params[:movie][:status].to_i,
                        image: params[:movie][:image])

    if @movie.save
      flash[:notice] = 'Filme criado com sucesso'
      return redirect_to(movies_path)
    end

    @directors = Director.all
    @movie_genres = MovieGenre.all
    render :new
  end

  def edit
    @movie = Movie.find(params[:id])
    @directors = Director.all
    @movie_genres = MovieGenre.all
  end

  def update
    @movie = Movie.find(params[:id])

    new_poster = nil
    unless params[:movie][:remove_image] == '1'
      if params[:movie][:image].present?
        new_poster = params[:movie][:image]
      elsif @movie.image.attached?
        new_poster = @movie.image.blob
      end
    end

    if @movie.update(title: params[:movie][:title],
                      year: params[:movie][:year],
                      synopsis: params[:movie][:synopsis],
                      country: params[:movie][:country],
                      duration: params[:movie][:duration],
                      director_id: params[:movie][:director_id],
                      movie_genre_id: params[:movie][:movie_genre_id],
                      status: params[:movie][:status].to_i,
                      image: new_poster)

      flash[:notice] = 'Filme atualizado com sucesso'
      return redirect_to(movies_path)
    end

    @directors = Director.all
    @movie_genres = MovieGenre.all
    render :edit
  end
end

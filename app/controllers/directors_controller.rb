class DirectorsController < ApplicationController
  def index
    @directors = Director.all
  end

  def show
    @director = Director.find(params[:id])
  end

  def new
    @director = Director.new
    @movie_genres = MovieGenre.all
  end

  def create
    @director = Director.new(name: params[:director][:name],
                              nationality: params[:director][:nationality],
                              birthdate: params[:director][:birthdate],
                              favorite_genre_id: params[:director][:favorite_genre_id])

    if @director.save
      flash[:notice] = 'Diretor criado com sucesso'
      return redirect_to(directors_path)
    end

    @movie_genres = MovieGenre.all
    render :new
  end

  def edit
    @director = Director.find(params[:id])
    @movie_genres = MovieGenre.all
  end

  def update
    @director = Director.find(params[:id])

    if @director.update(name: params[:director][:name],
                        nationality: params[:director][:nationality],
                        birthdate: params[:director][:birthdate],
                        favorite_genre_id: params[:director][:favorite_genre_id])

      flash[:notice] = 'Diretor  atualizado com sucesso'
      return redirect_to(directors_path)
    end

    @movie_genres = MovieGenre.all
    render :edit
  end
end

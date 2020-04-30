class MoviesController < ApplicationController

  before_action :authenticate_user!
  before_action :redirect_if_not_admin!, only: [:new, :create]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie
    else
      render :new
    end
  end

  def show
    @movie = Movie.find_by(id: params[:id])
  end

  private
    def movie_params
      params.require(:movie).permit(:title, :release_year)
    end


end #end of controller

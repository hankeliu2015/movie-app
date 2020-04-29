class MoviesController < ApplicationController

  # non authenticated users should not be able to see any of these routes
  # only authenticated users who are an admin can create , delete or edit a movie

  # user model
    # attributes
    # username
    # email
    # user password
    # admin: boolean dafault false <=regular user and admin

  # registration and login system
    # form to create an user account, with email, user and password
      # user signup, user info update, user deletion

    # session controller |  a form to login with email  and password
      # user login and logout

    # Userscontroller (optional)
      # user show profile page
      # employee page

  # helper method
    #is_logged_in?
    #current_user
    # authenticate_user! -> if a user is not logged , send them to a login screen

  # sessions what are they?

  def index
    @movies = Movie.all
    # binding.pry
    # byebug
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

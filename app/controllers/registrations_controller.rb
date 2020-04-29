class RegistrationsController < ApplicationController

  def new
    @user = User.new
    # load a form for new user
  end

  def create
    @user = User.new(params[:user])
  end
end

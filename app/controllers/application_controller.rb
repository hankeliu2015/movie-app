class ApplicationController < ActionController::Base
  helper_method :current_user, :is_logged_in, :authenticate_user!, :is_admin?

  def index
  end

  private
    def current_user
      @current_user = User.find_by(id: session[:user_id])
    end

    def is_logged_in?
      !!current_user
    end

    def authenticate_user!
      redirect_to new_session_path if !is_logged_in?
    end

    def is_admin?
      current_user.admin if current_user
    end

    def redirect_if_not_admin!
      # byebug
      redirect_to movies_path if !is_admin?
    end

end

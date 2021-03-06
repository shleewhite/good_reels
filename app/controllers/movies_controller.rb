class MoviesController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    
    def create
        @movie = current_user.movies.build(movie_params)
        if @movie.save
          flash[:success] = "You added a movie to your list!"
          redirect_to '/'
        else
          @feed_items = []
          render '/'
        end
    end
    
    private
    
    def movie_params
        params.require(:movie).permit(:content)
    end
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end

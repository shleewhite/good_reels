class MoviesController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    
    def create
        @movie = current_user.movie.build(movie_params)
        if @movie.save
          flash[:success] = "You added a movie to your list!"
          redirect_to root_url
        else
          render 'static_pages/home'
        end
    end
    def destroy
    end
    
    private
    
    def movie_params
        params.require(:movie).permit(:content)
    end
end

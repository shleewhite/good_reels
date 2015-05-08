class StaticPagesController < ApplicationController
  def home
    @movie = current_user.movies.build if logged_in?
  end

  def help
  end
end

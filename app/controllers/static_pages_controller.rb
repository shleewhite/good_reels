class StaticPagesController < ApplicationController
   def home
    if logged_in?
      @movie  = current_user.movies.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
   end

  def help
  end
end

class StartPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build if logged_in?
    #Becaus feed method has class Micropost(Micropost.where()..), rails looks for _micropost.html.erb partial
    if current_user
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end

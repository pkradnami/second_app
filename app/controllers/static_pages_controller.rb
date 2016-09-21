class StaticPagesController < ApplicationController

  before_filter :search, only: :home  

  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
  
  def search
    @search = User.search(params[:q])
    @projects = @search.result.page(params[:page])
  end
end

class FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  
  def index
    #   binding.pry
    #   @favorite = Favorite.includes(:microposts).where("favorites.user_id = #{params[:id]}")
    # @favorite = Micropost.includes(:favorites).where(favorites: {user_id: params[:id]})
    @favorite = Micropost.joins(:favorites).merge(Favorite.where(user_id: params[:id]))
  end
  
#   def new
#       @favorite = Favorite.new
#   end
  
  
   def create
    #   @favorite = current_user.microposts.build(micropost_params)
    binding.pry
    @favorite = Favorite.create(params_favorite)
        #  if @favoritemicropost.save
        #   flash[:success] = "Favorite created!"
        #   redirect_to root_url
        #  else
        #   @feed_items = []
        #   render 'static_pages/home'
        #  end
   end
  
  def destroy
       @favorite.destroy
       redirect_to root_url
  end

    private
        def params_favorite
            params.require(:favorites).permit(:micropost_id, :user_id)
        end
  
end

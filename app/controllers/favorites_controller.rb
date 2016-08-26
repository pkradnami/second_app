class FavoritesController < ApplicationController
  def index
      @favorite =Favorite.order("created_at DESC")
  end
  
  def create
        @favorite = Favorite.create(params_favorite)
  end

    private
        def params_favorite
            params.permit(:micropost_id, :user_id)
        end
  
end

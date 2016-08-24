class FavoritesController < ActionController::Base
    
   def create
    #  @favorite = User.first.favorite_microposts
     @favoritemicopost = Favorite.create(params_favoritemicropost)
   end

  private
   
    def params_favoritemicropost
        params.permit(:micropost_id, :user_id)
    end
#   def destroy
#     @favorite = Favorite.find_by(params[:id])
#     @favorite.destroy
#   end
end
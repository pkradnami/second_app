class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
  
  
  def index
    #   binding.pry
    #   @favorite = Favorite.includes(:microposts).where("favorites.user_id = #{params[:id]}")
    # @favorite = Micropost.includes(:favorites).where(favorites: {user_id: params[:id]})
    @favorite = Micropost.joins(:favorites).merge(Favorite.where(user_id: params[:id]))
  end
  
   def create
    
    # binding.pry
      @favorite = Favorite.new(user_id: params[:id], micropost_id: params[:micropost_id])
      if @favorite.save
          redirect_to 'https://sample-app-pkradnami.c9users.io/'
      else
        # TODO: 失敗した時のエラー処理を書く
        # render :text, 'Failed to save.' 
        redirect_to :action => "index"
      end
    #   redirect_to :action => "index"
   end
  

  def destroy
       @favorite = Favorite.find_by(micropost_id: params[:micropost_id])
      # @favorite = Favorite.find_by(id: 'user_id: params[:id], micropost_id: params[:micropost_id]')


       if @favorite.present?
          @favorite.destroy
          redirect_to root_url
    #   else
    #      redirect_to :action => 'create'
       end
  end

    # private
    #     def params_favorite
    #     #  params.permit(:micropost_id, :user_id, :id)
    #       params.require(:favorite).permit(:micropost_id, :user_id)
    #     end
  
end

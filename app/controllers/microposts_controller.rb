class MicropostsController < ApplicationController
    before_action :authenticate_user!
    before_action :correct_user,  only: :destroy
    
    
    def create
        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save
          flash[:success] = "Micropost created!"
          redirect_to root_url
        else
          @feed_items = []
          render 'static_pages/home'
        end
    end
    
    def destroy
       @micropost.destroy
       redirect_to root_url
    end
    
    # def fav
    # @micropost = Micropost.find(params[:id])
    #   if @micropost.favorites.blank?
    #     current_user.favorites.create(micropost: @micropost)
    #   else
    #     current_user.favorites.where(micropost: @micropost).destroy_all
    #   end
    # end
    
    private
    
      def micropost_params
          params.require(:micropost).permit(:content, :image)
      end
      
      def correct_user
          @micropost = current_user.microposts.find_by(id: params[:id])
          redirect_to root_url if @micropost.nil?
      end
end
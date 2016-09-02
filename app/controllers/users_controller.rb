class UsersController < ApplicationController
 before_action :authenticate_user!, :except=>[:show]
 before_action :admin_user,    only: :destroy
      
      def destroy
          User.find(params[:id]).destroy
          flash[:success] = "User destroyed."
          redirect_to users_url
      end
     
      def index
        @users = User.paginate(page: params[:page])
      end
     
      def show
        @user = User.find(params[:id])
        @microposts = @user.microposts.paginate(page: params[:page])
        @favorite = Favorite.new(micropost_id: @micropost.id,user_id: @user.id)
        # @favorite = current_user.favorite_microposts
        
      end
      
      def following
        @title = "Following"
        @user = User.find(params[:id])
        @users = @user.followed_users.paginate(page: params[:page])
        render 'show_follow'
      end
      
      def followers
        @title = "Followers"
        @user = User.find(params[:id])
        @users = @user.followers.paginate(page: params[:page])
        render 'show_follow'
      end
      
      def favorites
        @title = "Favorites"
        @user = User.find(params[:id])
        @users = @user.favorites.paginate(page: params[:page])
        render 'favorite/index'
      end
      
      
  private
  
      def admin_user
           redirect_to(root_path) unless current_user.admin?
      end

end

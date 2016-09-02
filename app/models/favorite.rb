class Favorite < ActiveRecord::Base
  belongs_to :micropost
  belongs_to :user
  validates :micropost_id, uniqueness: true
  validates :user_id, uniqueness: true
  
#   def self.from_users_favorites_by(user)
#       favorites = "SELECT favorites FROM favorite 
#                          WHERE favorites = :user_id"
#     where("user_id IN (#{favorites}) OR user_id = :user_id",
#           user_id: user.id)
#   end


#   def params_favorite
#   puts strong_params[:user_id]
#   puts strong_params[:micropost_id]
#   end
  
  
  
end

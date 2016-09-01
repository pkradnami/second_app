class Favorite < ActiveRecord::Base
  belongs_to :micropost
  belongs_to :user
  validates :micropost_id, uniqueness: true
  validates :user_id, uniqueness: true
  
  def params_favorite
   puts strong_params[:user_id]
   puts strong_params[:micropost_id]
  end
  
  
end

class Favorite < ActiveRecord::Base
  belongs_to :micropost
  belongs_to :user
  validates_uniqueness_of :user_id, scope: :micropost_id
  
  
  
end

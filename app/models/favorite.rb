class Favorite < ActiveRecord::Base
  belongs_to :micropost
  belongs_to :user
  validates :micropost_id, uniqueness: true
  validates :user_id, uniqueness: true
  
end
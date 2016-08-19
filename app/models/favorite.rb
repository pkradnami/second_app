class Favorite < ActiveRecord::Base
  belongs_to :favorite, class_name: "User"
  belongs_to :favorited, class_name: "User"
  validates :favorite_id, presence: true
  validates :favorited_id, presence: true
  belongs_to :user
end

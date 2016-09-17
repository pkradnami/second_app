module StaticPagesHelper
  def feed_item_is_favorited_by_current_user?(feed_item_id)
    !Favorite.find_by(user_id: current_user.id, micropost_id: feed_item_id).nil?
  end
end

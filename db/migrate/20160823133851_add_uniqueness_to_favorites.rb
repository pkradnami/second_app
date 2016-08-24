class AddUniquenessToFavorites < ActiveRecord::Migration
  def change
    add_index :favorites, [:user_id, :micropost_id], unique: true
  end
end

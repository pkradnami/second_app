class AddIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :micropost_id, :integer
    add_column :projects, :user_id, :integer
  end
end

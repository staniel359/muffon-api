class RenameProfilePostsTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :profile_posts, :posts
    change_column_null :posts, :other_profile_id, true
  end
end

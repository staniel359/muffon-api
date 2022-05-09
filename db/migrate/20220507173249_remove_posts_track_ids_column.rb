class RemovePostsTrackIdsColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :track_ids
  end
end

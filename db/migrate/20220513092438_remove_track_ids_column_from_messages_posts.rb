class RemoveTrackIdsColumnFromMessagesPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :messages, :track_ids
    remove_column :posts, :track_ids
  end
end

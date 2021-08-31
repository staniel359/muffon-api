class RemoveTrackIdIndexFromProfileTracks < ActiveRecord::Migration[6.1]
  def change
    remove_index :profile_tracks, :track_id
    remove_foreign_key :profile_tracks, :tracks
  end
end

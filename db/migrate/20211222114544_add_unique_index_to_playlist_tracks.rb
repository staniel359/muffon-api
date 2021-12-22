class AddUniqueIndexToPlaylistTracks < ActiveRecord::Migration[7.0]
  def change
    add_index :playlist_tracks, [:track_id, :playlist_id], unique: true
  end
end

class RenamePlaylistsPlaylistTracksCountColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :playlists, :playlist_tracks_count, :tracks_count
  end
end

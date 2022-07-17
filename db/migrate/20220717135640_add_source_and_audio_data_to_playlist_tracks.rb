class AddSourceAndAudioDataToPlaylistTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :playlist_tracks, :source_data, :jsonb
    add_column :playlist_tracks, :audio_data, :jsonb
    add_column :playlist_tracks, :album_source_data, :jsonb
  end
end

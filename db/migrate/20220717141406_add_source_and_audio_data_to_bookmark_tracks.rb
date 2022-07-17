class AddSourceAndAudioDataToBookmarkTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :bookmark_tracks, :source_data, :jsonb
    add_column :bookmark_tracks, :audio_data, :jsonb
    add_column :bookmark_tracks, :album_source_data, :jsonb
  end
end

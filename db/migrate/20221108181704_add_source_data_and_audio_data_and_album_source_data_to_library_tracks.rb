class AddSourceDataAndAudioDataAndAlbumSourceDataToLibraryTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :library_tracks, :source_data, :jsonb
    add_column :library_tracks, :audio_data, :jsonb
    add_column :library_tracks, :album_source_data, :jsonb
  end
end

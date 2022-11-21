class AddSourceDataAudioDataAlbumSourceDataToFavoriteTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :favorite_tracks, :source_data, :jsonb
    add_column :favorite_tracks, :audio_data, :jsonb
    add_column :favorite_tracks, :album_source_data, :jsonb
  end
end

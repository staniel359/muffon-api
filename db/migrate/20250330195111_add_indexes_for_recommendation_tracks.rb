class AddIndexesForRecommendationTracks < ActiveRecord::Migration[8.0]
  def change
    add_index :library_tracks, :track_id

    add_index :library_artists, :artist_id

    add_index :listened_tracks, :track_id

    add_index :listened_artists, :artist_id
  end
end

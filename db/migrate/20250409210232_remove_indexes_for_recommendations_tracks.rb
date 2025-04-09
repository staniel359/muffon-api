class RemoveIndexesForRecommendationsTracks < ActiveRecord::Migration[8.0]
  def change
    remove_index :library_artists, :artist_id

    remove_index :listened_tracks, :track_id

    remove_index :listened_artists, :artist_id
  end
end

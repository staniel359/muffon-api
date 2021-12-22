class AddUniqueIndexToFavoriteTracks < ActiveRecord::Migration[7.0]
  def change
    add_index :favorite_tracks, [:track_id, :profile_id], unique: true
  end
end

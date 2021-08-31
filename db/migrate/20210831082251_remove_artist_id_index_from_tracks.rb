class RemoveArtistIdIndexFromTracks < ActiveRecord::Migration[6.1]
  def change
    remove_index :tracks, :artist_id
    remove_foreign_key :tracks, :artists
  end
end

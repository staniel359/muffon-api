class AddUniqueIndexToFavoriteArtists < ActiveRecord::Migration[7.0]
  def change
    add_index :favorite_artists, [:artist_id, :profile_id], unique: true
  end
end

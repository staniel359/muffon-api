class RemoveArtistIdIndexFromProfileArtists < ActiveRecord::Migration[6.1]
  def change
    remove_index :profile_artists, :artist_id
    remove_foreign_key :profile_artists, :artists
  end
end

class AddUniqueIndexToProfileArtists < ActiveRecord::Migration[7.0]
  def change
    add_index :profile_artists, [:artist_id, :profile_id], unique: true
  end
end

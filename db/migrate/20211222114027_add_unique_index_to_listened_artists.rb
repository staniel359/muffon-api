class AddUniqueIndexToListenedArtists < ActiveRecord::Migration[7.0]
  def change
    add_index :listened_artists, [:artist_id, :profile_id], unique: true
  end
end

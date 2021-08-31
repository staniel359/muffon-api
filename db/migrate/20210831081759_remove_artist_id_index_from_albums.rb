class RemoveArtistIdIndexFromAlbums < ActiveRecord::Migration[6.1]
  def change
    remove_index :albums, :artist_id
    remove_foreign_key :albums, :artists
  end
end

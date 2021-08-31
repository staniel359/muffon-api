class RemoveAlbumIdIndexFromProfileAlbums < ActiveRecord::Migration[6.1]
  def change
    remove_index :profile_albums, :album_id
    remove_foreign_key :profile_albums, :albums
  end
end

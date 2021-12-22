class AddUniqueIndexToListenedAlbums < ActiveRecord::Migration[7.0]
  def change
    add_index :listened_albums, [:album_id, :profile_id], unique: true
  end
end

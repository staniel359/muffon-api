class AddUniqueIndexToBookmarkAlbums < ActiveRecord::Migration[7.0]
  def change
    add_index :bookmark_albums, [:album_id, :profile_id], unique: true
  end
end

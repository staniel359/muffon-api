class AddUniqueIndexToAlbums < ActiveRecord::Migration[7.0]
  def change
    add_index :albums, [:title, :artist_id], unique: true
  end
end

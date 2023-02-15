class AddIndexToAlbums < ActiveRecord::Migration[7.0]
  def change
    add_index :albums, :artist_id
  end
end

class AddAlbumTypeToAlbums < ActiveRecord::Migration[6.1]
  def change
    add_column :albums, :album_type, :integer
  end
end

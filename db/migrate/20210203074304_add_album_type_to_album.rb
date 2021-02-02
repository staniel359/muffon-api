class AddAlbumTypeToAlbum < ActiveRecord::Migration[6.0]
  def change
    add_column :albums, :album_type, :integer
  end
end

class RemoveAlbumTypeFromAlbums < ActiveRecord::Migration[6.1]
  def change
    remove_column :albums, :album_type, :string
  end
end
